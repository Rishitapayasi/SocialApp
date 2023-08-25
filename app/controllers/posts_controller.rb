class PostsController < ApplicationController
  before_action :authenticate_request, except:[:index, :show]
  before_action :set_post, only: [:update ,:destroy]
 
  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: [@post, @post.comments, @post.likes] 
  end

  def create
    
     
    @post = @current_user.posts.build(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors, status: 422
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
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
    @post = @current_user.posts.find(params[:id])
  end

  
end
