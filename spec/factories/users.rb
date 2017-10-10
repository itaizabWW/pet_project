# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryGirl.define do

  factory :user do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
  end
end
