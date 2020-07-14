class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
  	@post = Post.new
  end

  def index
  	@posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
  		redirect_to posts_path
  	else
  		render :new
  	end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:body)
  end
end
