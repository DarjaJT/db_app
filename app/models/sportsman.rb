class Sportsman < ApplicationRecord
  belongs_to :user, optional: true

  validates :address, presence: { message: "Field must not be empty!"}


end
