class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :sets, :reps, :weight
  belongs_to :workout
end
