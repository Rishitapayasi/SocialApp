class CommentsController < ApplicationController
  before_action :authenticate_request

  def create 
    @post= Post.find(params[:post_id])
    @comment = @current_user.comments.build(comment_params)

    if @comment.save 
      render plain:  "comment created"
    else 
      render 'posts/show'
    end

  end

  def destroy 
 
    @comment = @current_user.comments.find(params[:id])
    
    if @comment.destroy 
      render plain:   "comment deleted"
    else 
      render plain: "error in deleting comment"
    end 
  end

  private 

  def comment_params
    params.permit(:comment, :user_id, :post_id)
  end
  
end
