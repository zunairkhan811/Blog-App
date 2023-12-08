class CommentsController < ApplicationController
  def create
    @comment = Comment.new(user_id: current_user.id, post_id: params[:post_id], text: params[:text])
    if @comment.save
      redirect_to user_post_path(:user_id, :post_id), notice: 'Your comment has been successfully created.'
    else
      redirect_to user_post_path(:user_id, :post_id), alert: 'Error creating comment.'
    end
  end
end
