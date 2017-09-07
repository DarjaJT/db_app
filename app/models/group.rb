class Group < ApplicationRecord
  belongs_to :user
  has_many :hall_groups, dependent: :destroy
  has_many :groups, :through => :hall_groups

  validates :name, presence: { message: "Field must not be empty!"},
            length: { maximum: 50, too_long: "%{count} it's too long!",  minimum: 3, too_short: "%{count} it's too short!" }
  validates :name, uniqueness: { message: "Such a group is already there"}

end
