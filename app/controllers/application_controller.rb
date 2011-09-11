class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_characters
  before_filter :load_categories

  def load_characters
    @sidebar_characters = Character.recently_changed.alphabetically.limit(3)
  end

  def load_categories
    @sidebar_categories = Category.recently_changed.alphabetically.limit(5)
  end

end
