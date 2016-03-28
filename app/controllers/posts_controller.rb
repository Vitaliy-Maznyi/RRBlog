class PostsController < ApplicationController

  def index
    if params[:search]
      @post = Post.search(params[:search])
    else
      @post = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to posts_url
    end
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user.id
      redirect_to posts_url
    end
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
