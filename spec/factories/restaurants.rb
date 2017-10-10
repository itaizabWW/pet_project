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


FactoryGirl.define do

  factory :restaurant do
    name { Faker::Name.name }
    address { Faker::Address.full_address }
    max_delivery_time {Faker::Number.between(0,60)}
    cuisine
    kosher false
    ten_bis false

    trait :kosher do
      kosher true
    end

    trait :ten_bis do
      ten_bis true
    end
  end
end
