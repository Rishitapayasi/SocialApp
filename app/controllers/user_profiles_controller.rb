class UserProfilesController < ApplicationController
  
  def index
    @user_profile = UserProfile.all 

    render json: @user_profile
  end 
   
  def show 
    @user_profile = UserProfile.find(params[:id])

    render json: @user_profile
  end

  def create 
    @user_profile = UserProfile.new(user_profile_params) 

    if @user_profile.save 
      redirect_to @user_profile 
    else 
      render :new, status: :unprocessable_entity 
    end 
  end 

  def edit
    @user_profile = UserProfile.find(params[:id]) 
  end 
   
  def update 
    @user_profile = UserProfile.find(params[:id]) 
    
    if @user_profile.update(user_profile_params) 
      redirect_to @user_profile 
    else 
      render :edit, status: :unprocessable_entity 
    end 
  end 

  def destroy  
    @user_profile = UserProfile.find(params[:id])
    @user_profile.destroy
  end
 
  private 
  def user_profile_params 
    params.require(:user_profile).permit(:full_name, :bio, :birth_date)
  end
end


