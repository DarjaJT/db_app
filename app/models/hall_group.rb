class HallGroup < ApplicationRecord
  belongs_to :hall
  belongs_to :group

  validates :hall_id, presence: { message: "Field must not be empty!"}
  validates :group_id, presence: { message: "Field must not be empty!"}
  validates :hall_id, uniqueness: { scope: :group_id, message: "In this hall there is already such a group!" }


end
