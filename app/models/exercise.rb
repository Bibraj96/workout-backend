class Exercise < ApplicationRecord
  belongs_to :workout

  validates :name, :sets, :reps, :weight presence: true
end
