# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  rating     :decimal(, )      default(0.0)
#  tenbis     :boolean
#  address    :string
#  maxDevTime :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cuisine_id :integer
#  kosher     :boolean
#

class Restaurant < ApplicationRecord
  has_many :reviews , dependent: :destroy
  has_many :users , :through => :reviews
  belongs_to :cuisine

  validates :name, :presence => true, :allow_nil => false, :allow_blank => false
  validates :name, :uniqueness => true

  def calculate_rating
    cur_reviews = Review.where(restaurant_id: self.id)
    ratings = 0
    cur_reviews.each do |r|
      ratings += r.rating
    end
    ratings / reviews.count
  end

  def parse_csv(file_name)
    require 'csv'
    csv_text = File.read(Rails.root.join('lib', 'seeds', file_name))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

    csv.each do |row|
      t = Restaurant.new
      cur_cuisine = Cuisine.find_by name: row['Cuisine']
      t.cuisine_id = cur_cuisine.id
      # couldnt get data by row['Name']
      t.name = row[0]
      t.kosher = row['Kosher']
      t.tenbis = row['10bis']
      t.address = row['Address']
      t.save
    end

    puts "There are now #{Restaurant.count} rows in the restaurant table"
  end
end
