# == Schema Information
#
# Table name: restaurants
#
#  id                :integer          not null, primary key
#  name              :string
#  rating            :decimal(, )      default(0.0)
#  ten_bis           :boolean
#  address           :string
#  max_delivery_time :decimal(, )      default(0.0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cuisine_id        :integer
#  kosher            :boolean
#

class Restaurant < ApplicationRecord
  has_many :reviews , dependent: :destroy
  has_many :users , through: :reviews
  belongs_to :cuisine

  validates :name, presence: true, allow_nil: false, allow_blank: false
  validates :name, uniqueness: true

  def update_rating!
    update!(rating: calculate_rating)
  end

  def parse_csv(file_name)
    require 'csv'
    csv_text = File.read(Rails.root.join('lib', 'seeds', file_name))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')

    csv.each do |row|
      t = Restaurant.new
      cur_cuisine = Cuisine.find_by name: row['Cuisine']
      t.cuisine_id = cur_cuisine.id
      # couldnt get data by row['Name']
      t.name = row[0]
      t.kosher = row['Kosher']
      t.ten_bis = row['10bis']
      t.address = row['Address']
      t.save
    end

    puts "There are now #{Restaurant.count} rows in the restaurant table"
  end

  private

  def calculate_rating
    Review.where(restaurant_id: id).average(:rating)
  end
end
