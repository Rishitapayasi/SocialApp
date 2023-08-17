class PostsController < ApplicationController
  before_action :set_student, only: [ :create , :update ,:destroy]
  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    @post = @user.posts.find(params[:id])
    
    render json: [@post, @post.comments, @post.likes] 
  end

  def create
    # @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params) 

    if @post.save
      render json: @post
    else
      render json: @post.errors, status: 422
    end
  end

  def update
    @post = @user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render json: @post.errors, status: 422
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy
    #render json: @post
  end

  private
  def post_params
    params.permit(:content, :image)
  end 

  def set_student 
    @user = User.find(params[:id])
  end
end
