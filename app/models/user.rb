class User < ApplicationRecord
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  has_secure_password
end
