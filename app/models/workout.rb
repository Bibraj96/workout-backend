class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises

  validates :user, :title, :description, :date, presence: true
end
