class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # kept getting "password can't be blank" error without wrap_parameters
  wrap_parameters :user, include: [:email, :username, :password, :password_confirmation]

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: user, status: :created
    else
      resp = {
        error: user.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
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
