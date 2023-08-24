class ProfilesController < ApplicationController
  before_action :set_profile, only: [ :show , :update ,:destroy]


  def index
    @profile = UserProfile.all 

    render json: @profile
  end 
   
  def show 
    render json: @profile
  end

  def create 
    @profile = UserProfile.create(profile_params)

    if @profile.save 
      # render json: @profile 
      render plain: "profile created"
    else
      render json: @profile.errors, status: 422
    end 
  end 

  def update 
    # if params[:user_id] == @profile.user_id
      if @profile.update(profile_params) 
        render json: @user.profile 
      else
        render json: @profile.errors, status: 422
      end
    # else 
    #   render json:{error:"you are not authorized to update this profile"}, status: 403
    # end
  end 

  def destroy  
    @profile.destroy
  end
 
  private 
  def profile_params 
    params.permit(:full_name, :bio, :birth_date)
  end

  def set_profile
    @profile = UserProfile.find(params[:id])
  end
  
  # def authorize_user
  #   unless current_user == @profile.user
  #     flash[:error] = "you are not authorize to perform this action"
  #     redirect_to post_path(@post)
  #   end
  # end
end


