class Hall < ApplicationRecord
  has_many :hall_groups
  has_many :groups, :through => :hall_groups

end
