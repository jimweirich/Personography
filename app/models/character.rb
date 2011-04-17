class Character < ActiveRecord::Base
  has_many :tags, :order => "category, value", :dependent => :destroy

  def aliases
    names = tags.find(:all, :conditions => ["category=?", "aka"])
    names.map { |tag| tag.value }
  end
end
