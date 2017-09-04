class Group < ApplicationRecord
  has_many :hall_groups
  has_many :halls, :through => :hall_groups

end
