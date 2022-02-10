class User < ApplicationRecord
  before_validation { self.email = email.downcase}
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :password, :password_confirmation, length: { in: 6..20 }
  validates :password, confirmation: true
  validates :email, uniqueness: true
  validates :email, format: { with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "%{value} is invalid "}
  has_secure_password
end
