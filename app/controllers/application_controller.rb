class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

  def current_user
    @current_user ||= User.from_uid(google_user_id || casual_user_id)
  end

  def google_user_id
    session[:user_id]
  end

  def casual_user_id
    params[:uid]
  end

  helper_method :current_user
end
