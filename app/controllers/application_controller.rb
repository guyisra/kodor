class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

  def current_user
    @current_user ||= google_user || casual_user
  end

  def google_user
    User.find_by(id: session[:user_id])
  end

  def casual_user
    User.find_by(uid: params[:uid])
  end

  helper_method :current_user
end
