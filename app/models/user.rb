class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: {minimum: 4, maximum: 100}
  validates :password_digest, presence: true
  validates :username, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: false }, uniqueness: true
end
