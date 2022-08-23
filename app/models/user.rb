class User < ApplicationRecord

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates(:username, presence: true, length: {minimum: 3, maximum: 25})
  validates(:email, presence: true,
            length: {minimum: 3, maximum: 120},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false })

  has_secure_password

  validates(:password, presence: true, length: { minimum: 6, maximum: 25 })

end
