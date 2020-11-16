class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :description
  belongs_to :user
  has_many :exercises
end
