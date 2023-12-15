class CommentsController < ApplicationController
  before_action :find_user
  before_action :find_post
  def index
    @comments = @post.comments
  end
  def new
    @comment = Comment.new
  end

  def create
    # puts "Params: #{params.inspect}"
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]
    puts "Comment before save: #{@comment.inspect}"
    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment created successfully.'
    else
      render :new, notice: 'Error occured in creating a comment'
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = @user.posts.find(params[:post_id])
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
