class Api::V1::WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]

  def index
    if logged_in?
      workouts = current_user.workouts
      render json: workouts
    else
      render json: {
        error: "You must be logged in to view workouts!"
      }
    end
  end

  def show
    render json: workout
  end

  def create
    workout = Workout.new(workout_params)
    byebug
    if workout.save
      render json: workout, status: :created
    else
      resp = {
        error: workout.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  private

  def set_workout
    workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :date, :user_id)
  end
  
end
