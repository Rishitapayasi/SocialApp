class ProfilesController < ApplicationController
  before_action :set_student, only: [:show, :create , :update ,:destroy]
  def index
    @profile = UserProfile.all 

    render json: @profile
  end 
   
  def show 
    @profile = @user.profile.find(params[:id])

    render json: @profile
  end

  def create 
    @profile = @user.build_profile(profile_params) 

    if @profile.save 
      render json: @profile 
    else
      render json: @profile.errors, status: 422
    end 
  end 

  def update 
    @user = User.find(params[:user_id])
     
    
    if params[:user_id] == @profile.user_id
      if @profile.update(profile_params) 
        render json: @user.profile 
      else
        render json: @profile.errors, status: 422
      end
    else 
      render json:{error:"you are not authorized to update this profile"}, status: 403
    end
  end 

  def destroy  
    @profile = Profile.find(params[:id])
    @profile.destroy
  end
 
  private 
  def profile_params 
    params.permit(:full_name, :bio, :birth_date)
  end

  def set_student 
    @user = User.all
  end

end


