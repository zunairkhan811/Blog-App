class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]
  def index
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Your Post has been successfully Created'
    else
      render :new, notice: "Error in creating a post"
    end
  end

  def show; end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
        redirect_to user_path(current_user), notice: 'Post has been deleted successfully'
    end
end

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter, :author_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to user_post_path, notice: e
  end
end
