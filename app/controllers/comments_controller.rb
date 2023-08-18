class CommentsController < ApplicationController
  before_action :authenticate_user

  def create 
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user 
     
    if @comment.save 
      flash[:success] = "comment created"
    else 
      render 'posts/show'
    end
  end

  def destroy 
    @comment = Comment.find(params[:id])
    @post = @comment.post 

    if @comment.destroy 
      flash[:success] = "comment deleted"
    else 
      flash[:error] = "error in deleting comment"
    end 
  end

  private 

  def comment_params
    params.permit(:comment)
  end
  
end
