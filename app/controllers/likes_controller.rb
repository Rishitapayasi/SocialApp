class LikesController < ApplicationController
   before_action :authenticate_request
   
  def create
    @post = Post.find(params[:post_id])
    @like = @current_user.likes.build(post: @post)

    if @like.save
     render plain: "liked the comment"
    else 
      render plain:   "eroor liking" 
    end 
  end

  def destroy
   
    @like = @current_user.likes.find(params[:id])

    if @like.destroy
      render plain:  "you unliked the post"
    else 
      render plain:  "error in unliking post"
    end 
  end
end
