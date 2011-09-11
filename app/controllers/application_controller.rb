class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]

  before_filter :load_characters
  before_filter :load_categories

  private

  def authenticate
    unless current_user
      save_location
      redirect_to login_url, :notice => "Please log in..."
    end
  end

  def save_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or(default, options={})
    redirect_to(session[:return_to] || default, options)
    session[:return_to] = nil
  end

  def load_characters
    @sidebar_characters = Character.recently_changed.alphabetically.limit(3)
  end

  def load_categories
    @sidebar_categories = Category.recently_changed.alphabetically.limit(5)
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  rescue ActiveRecord::RecordNotFound => ex
    session[:current_user_id] = nil
    nil
  end
end
