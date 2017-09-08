class User < ApplicationRecord
  has_one :sportsman, dependent: :destroy
  has_one :trainer, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :halls, dependent: :destroy # Пользователь имеет_много залов.

  accepts_nested_attributes_for :trainer # sends nested attributes to the user
  accepts_nested_attributes_for :sportsman # sends nested attributes to the user

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validate :should_be_someone # Should be or trainer or sportsman

  def User.new_remember_token # are affiliated with the User class
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token) # are affiliated with the User class
    Digest::SHA1.hexdigest(token.to_s)
  end



  private

    def should_be_someone
      # if self.trainer.blank? || !self.trainer.valid?
      if (!self.trainer&.valid?) && (self.sportsman.blank? || !self.sportsman.valid?)
        self.errors.add(self.class.name, 'must be someone.')
      end
    end


    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end


end
