class FollowsController < ApplicationController
 before_action :authenticate_request

  def create 
    @follower_user = User.find(params[:follower_id])
    @follow = @current_user.followers.build(followed: @user)
    debugger
    if @follow.save 
      render plain: "you are now following this user"
    else 
      render plain: "error following user"
    end 

  end 

  def destroy
  
    @follow = @current_user.follower.find_by(params[:id])
    if @follow.destroy 
      render plain: "you unfollow this user"
    else 
      render plain: "error unfollowing user"
    end 
  end
end
