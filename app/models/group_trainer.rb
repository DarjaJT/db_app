class GroupTrainer < ApplicationRecord
  belongs_to :trainer
  belongs_to :group


  validates :trainer_id, presence: { message: "Field must not be empty!"}
  validates :group_id, presence: { message: "Field must not be empty!"}
  validates :trainer_id, uniqueness: { scope: :group_id, message: "In this hall there is already such a group!" }

end
