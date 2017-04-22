class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  def index
    @post = if params[:search]
              Post.search(params[:search])
            else
              Post.all
            end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    redirect_to root_path unless current_user
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user
    @post.save ? (redirect_to @post) : (render 'new')
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params) ? (redirect_to @post) : (render 'edit')
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
