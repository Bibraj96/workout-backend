class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    byebug
    if user.save
      render json: user, staus: :created
    else
      resp = {
        error: user.errors.full_messages.to_sentence
      }
      render json: resp, status :unprocessable_entity
    end
  end

  def show
    
  end

  private

  def set_user
    user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
  
end
