class UsersController < ApplicationController

  def index
    @user = User.all

    render json: @user
  end

  def show
    @user = User.find(params[:id])
    

    render json: [@user, @user.user_profile] 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end 

end
