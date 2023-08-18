class PostsController < ApplicationController
  # before_action :authenticate_user, except:[:index, :show]
  before_action :set_post, only: [ :show , :update ,:destroy]
  before_action :authorize_user, only:[:update, :destroy]
  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    render json: [@post, @post.comments, @post.likes] 
  end

  def create
    
    @post = current_user.posts.build(post_params)

    if @post.save
      render json: @post
    else
      render json: @post.errors, status: 422
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render json: @post.errors, status: 422
    end
  end

  def destroy
   
    @post.destroy
  
  end

  private
  def post_params
    params.permit(:content, :image)
  end 

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user 
    unless current_user == @post.user
      # flash[:error] = "you are not authorize to perform this action"
      redirect_to post_path(@post)
    end
  end
end
