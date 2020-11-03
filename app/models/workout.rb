class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises

  validates :title, :date, presence: true
end
