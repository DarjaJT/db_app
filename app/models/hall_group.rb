class HallGroup < ApplicationRecord
  belongs_to :hall
  belongs_to :group
  validates :hall_id, presence: true
  validates :group_id, presence: true




end
