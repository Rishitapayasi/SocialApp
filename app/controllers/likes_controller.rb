class LikesController < ApplicationController
   before_action :authenticate_user 
   
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      flash[:success] = "liked the comment"
    else 
      flash[:error] = "eroor liking" 
    end 
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])

    if @like.destroy
      flash[:success] = "you unliked the post"
    else 
      flash[:error] = "error in unliking post"
    end 
  end
end
