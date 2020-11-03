class User < ApplicationRecord
  has_secure_password
  has_many :workouts

  validates :email, :username, :password, presence: true
end
