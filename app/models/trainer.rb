class Trainer < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy# optional- что бы сохронял ид пользователя тренеру

  QUALIF_SELECT = [[' ', ], ['V','V'], ['IV', 'IV'], ['III', 'III'], ['II', 'II'], ['I', 'I'] ]

  validates :qualif, presence: { message: "Field must not be empty!"}
end
