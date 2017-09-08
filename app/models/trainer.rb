class Trainer < ApplicationRecord
  belongs_to :user, optional: true # optional- что бы сохронял ид пользователя тренеру

  has_many :group_trainers, dependent: :destroy
  has_many :groups, :through => :group_trainers

  QUALIF_SELECT = [[' ', ], ['V','V'], ['IV', 'IV'], ['III', 'III'], ['II', 'II'], ['I', 'I'] ]

  validates :qualif, presence: { message: "Field must not be empty!"}

end