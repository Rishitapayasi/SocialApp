class FollowsController < ApplicationController
  before_action :authenticate_user, only:[:create, :destroy]

  def create 
    @user = User.find(params[:followed_id])
    @follow = @user.follows_as_follower.build(followed: @user)
    if @follow.save 
      render plain: "you are now following this user"
    else 
      render plain: "error following user"
    end 

  end 

  def destroy
    @user = User.find(params[:followed_id])
    @follow = @user.follows_as_follower.find_by(followed: @user)
    if @follow.destroy 
      render plain: "you unfollow this user"
    else 
      render plain: "error unfollowing user"
    end 
  end
end
