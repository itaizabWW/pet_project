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

require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
