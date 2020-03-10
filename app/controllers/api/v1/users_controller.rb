class Api::V1::UsersController < ApplicationController

  before_action :find_user, only: [:show, :update, :delete]
  before_action :get_all_users, only: [:index, :create, :delete]

  def index
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      render json: @user 
    else
      render status: 418
    end
  end
  
  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: {errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def get_all_users
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
