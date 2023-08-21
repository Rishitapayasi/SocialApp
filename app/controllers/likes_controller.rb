class LikesController < ApplicationController
  #  before_action :authenticate_user 
   
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: user_id)

    if @like.save
     render plain: "liked the comment"
    else 
      render plain:   "eroor liking" 
    end 
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])

    if @like.destroy
      render plain:  "you unliked the post"
    else 
      render plain:  "error in unliking post"
    end 
  end
end
