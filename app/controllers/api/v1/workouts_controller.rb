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
  end

  private

  def set_workout
    workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :date)
  end
  
end
