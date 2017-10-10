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

class User < ApplicationRecord
  has_many :reviews ,dependent: :destroy
  has_many :restaurants, :through => :reviews

  validates :email,  :name, presence: true, allow_blank: false, allow_nil: false
end
