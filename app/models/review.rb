# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  rating        :decimal(, )
#  comment       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#  user_id       :integer
#

class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :comment , :presence => true
  validates :user_id, :restaurant_id, :presence => true, :allow_nil => false, :allow_blank => false

  def update_restaurant_rating
    cur_rest = Restaurant.find(self.restaurant_id)
    cur_rest.rating = cur_rest.calculate_rating
    cur_rest.save
  end
end
