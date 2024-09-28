class Student < ApplicationRecord
  VALID_EMAIL_REGEX = VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validates :email, presence: true, length: { maximum: 100 },
            uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
