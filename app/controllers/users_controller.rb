require "json_web_token"
class UsersController < ApplicationController

  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :update,:destroy]
  
  def index
    @user = User.all

    render json: @user
  end

  def show
    render json: [@user, @user.profile] 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: 422
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render json: @user.errors, status: 422
    end
  end

  def destroy
     @user.destroy
  end

  private
  def user_params
    params.permit(:email, :password)
  end 


  def set_user
    @user = User.find(params[:id])
  end 

end
