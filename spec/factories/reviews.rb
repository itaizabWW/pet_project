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


FactoryGirl.define do

  factory :review do
    restaurant
    rating { Faker::Number.between(1,3) }
    comment { Faker::Lorem.word }
    user
  end
end
