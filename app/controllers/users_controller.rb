class UsersController < ApplicationController
  before_action :set_user, only: %i[show new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio, :posts_counter)
  end

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to users_path, notice: e
  end
end
