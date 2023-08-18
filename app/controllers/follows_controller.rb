class FollowsController < ApplicationController
  before_action :authenticate_user, only:[:create, :destroy]

  def create 
    @user = User.find(params[:followed_id])
    @follow = current_user.follows_as_follower.build(followed: @user)
    if @follow.save 
      flash[:success] ="you are now followingthis user"
    else 
      flash[:error] ="error following user"
    end 

  end 

  def destroy
    @user = User.find(params[:followed_id])
    @follow = current_user.follows_as_follower.find_by(followed: @user)
    if @follow.destroy 
      flash[:success] ="you unfollow this user"
    else 
      flash[:error] ="error unfollowing user"
    end 
  end
end
