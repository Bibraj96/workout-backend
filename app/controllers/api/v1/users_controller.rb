class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    byebug
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
