class LikesController < ApplicationController
    def create
      @like = Like.new(user_id: params[:user_id], post_id: params[:post_id])
      if @like.save
        redirect_to redirect_url, notice: "You have successfully liked the post"
      else
        redirect_to redirect_url, alert: "Error occurred while liking the post"
      end
    end
  
    private
  
    def redirect_url
      if request.referer.present? && request.referer.include?("/users/#{params[:user_id]}/posts")
        # If the referrer URL contains "/users/:user_id/posts", redirect to that URL
        request.referer
      else
        # Default redirect URL if no referrer or referrer doesn't match the pattern
        user_posts_path(params[:user_id])
      end
    end
end
  