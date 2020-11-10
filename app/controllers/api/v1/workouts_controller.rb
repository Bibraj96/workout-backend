class Api::V1::WorkoutsController < ApplicationController

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
  
end
