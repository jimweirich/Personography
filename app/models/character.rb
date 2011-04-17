class Character < ActiveRecord::Base
  has_many :tags, :order => "category, value", :dependent => :destroy do
    def matching(cat)
      find(:all, :conditions => ["category=?", cat])
    end
  end

  def aliases
    tags.matching("aka").map(&:value)
  end
end
