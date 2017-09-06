class HallGroup < ApplicationRecord
  belongs_to :hall
  belongs_to :group
  validates :hall_id, presence: true
  validates :group_id, presence: true

  # validates :hall_id, :group_id, uniqueness: true
  validates :hall_id, uniqueness: { scope: :group_id, message: "In this hall there is already such a group!" }




end
