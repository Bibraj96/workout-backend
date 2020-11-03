class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :title, :date
  belongs_to :user
  has_many :exercises
end
