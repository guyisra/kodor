class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.uid
    rescue
      flash[:warning] = 'You are not a Klarna employee. Please see www.klarnaisrael.com for more details'
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id) if current_user
    redirect_to root_path
  end
end
