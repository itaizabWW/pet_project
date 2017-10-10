# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryGirl.define do

  factory :cuisine do
    name Faker::Lorem.word
  end
end
