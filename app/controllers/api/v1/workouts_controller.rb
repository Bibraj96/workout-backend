class Api::V1::WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show]

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
    workout = current_user.workouts.build(workout_params)
    if workout.save
      render json: workout, status: :created
    else
      resp = {
        error: workout.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    workout = Workout.find(params[:id])
    if workout.update(workout_params)
      render json: workout, status: :ok
    else
      resp = {
        error: workout.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def destroy
    workout = Workout.find(params[:id])
    if workout.destroy
      render json: {message: "Your workout has been deleted!"}, status: :ok
    else
      resp = {
        error: "Workout does not exist."
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  private

  def set_workout
    workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :date)
  end
  
end
