class User < ApplicationRecord
  has_secure_password
  has_many :workouts

  validates :email, :username, presence: true
  validates :username, uniqueness: true
end
