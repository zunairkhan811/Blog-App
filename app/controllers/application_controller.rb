class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # protect_from_forgery with: :exception
  # helper_method :current_user

  # def current_user
  #   @current_user ||= User.first
  # end
end
