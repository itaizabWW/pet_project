# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  rating     :decimal(, )      default(0.0)
#  tenbis     :boolean
#  address    :string
#  price      :decimal(, )
#  maxDevTime :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cuisine_id :integer
#

class Restaurant < ApplicationRecord
  has_many :reviews , dependent: :destroy
  has_many :users , :through => :reviews
  belongs_to :cuisine


  #validates :name , :address ,presence:true,allow_nil:false, allow_blank: true
  validates :name, :presence => true, :allow_nil => false, :allow_blank => false
  validates :price, numericality: true


  def calculate_rating
    cur_reviews = Review.where(restaurant_id: self.id)
    ratings = 0
    cur_reviews.each do |r|
      ratings += r.rating
    end
    ratings / reviews.count


  end

end
