class ProfilesController < ApplicationController
  before_action :authenticate_request, except:[:index, :show]
  before_action :set_profile, only: [ :show , :update ,:destroy]


  def index
    @profile = UserProfile.all 

    render json: @profile
  end 
   
  def show 
    render json: @profile
  end

  def create 
    @profile = @current_user.build_user_profile(profile_params)

    if @profile.save 
      # render json: @profile 
      render plain: "profile created"
    else
      render json: @profile.errors, status: 422
    end 
  end 

  def update 
   
      if @profile.update(profile_params) 
        render json: @profile
      else
        render json: @profile.errors, status: 422
      end
    
  end 

  def destroy  
    @profile.destroy
  end
 
  private 
  
  def profile_params 
    params.permit(:full_name, :bio, :birth_date)
  end

  def set_profile
    @profile = @current_user.user_profile
  end
  
  
end


