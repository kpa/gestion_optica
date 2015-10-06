# == Schema Information
#
# Table name: eyeglasses_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EyeglassesType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  attr_accessible :name
end
