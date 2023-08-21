class CommentsController < ApplicationController
  before_action :authenticate_user

  def create 
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = user_id
     
    if @comment.save 
      render plain:  "comment created"
    else 
      render 'posts/show'
    end
  end

  def destroy 
    @comment = Comment.find(params[:id])
    @post = @comment.post 

    if @comment.destroy 
      render plain:  = "comment deleted"
    else 
      render plain: = "error in deleting comment"
    end 
  end

  private 

  def comment_params
    params.permit(:comment)
  end
  
end
