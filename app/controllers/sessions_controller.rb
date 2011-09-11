class SessionsController < ApplicationController
  skip_filter :authenticate

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_back_or root_url, notice: "Welcome back, #{user.name}"
    else
      redirect_to login_url, alert: "Invalid Login"
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url
  end
end
