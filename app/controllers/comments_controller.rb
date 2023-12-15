class CommentsController < ApplicationController
  before_action :set_user
  before_action :set_post
  def index
    @comments = @post.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@post.author, @post), notice: '🎊 Bravo, you have created your comment!'
    else
      flash[:alert] = 'Apologies try again!'
      redirect_to user_post_path(@post.author, @post)
    end
  end

  # def create
  #   # puts "Params: #{params.inspect}"
  #   @comment = Comment.new(comment_params)
  #   @comment.user_id = params[:user_id]
  #   @comment.post_id = params[:post_id]
  #   puts "Comment before save: #{@comment.inspect}"
  #   if @comment.save
  #     redirect_to user_posts_path(current_user), notice: 'Comment created successfully.'
  #   else
  #     render :new, notice: 'Error occured in creating a comment'
  #   end
  # end

  def show; end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    return unless @comment.destroy

    redirect_to user_posts_path(current_user), notice: 'Comment has been deleted successfully'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end



# class CommentsController < ApplicationController

#   def new
#     @comment = Comment.new
#   end
#   def create
#     @comment = Comment.new(user_id: current_user.id, post_id: params[:post_id], text: params[:text])
#     if @comment.save
#       redirect_to user_post_path(current_user.id, post_id: params[:post_id]), notice: 'Your comment has been successfully created.'
#     else
#       redirect_to user_post_path(current_user.id, post_id: params[:post_id]), alert: 'Error creating comment.'
#     end
#   end
# end
