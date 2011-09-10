class Character < ActiveRecord::Base
  has_many :tags, :dependent => :destroy do
    def matching(cat)
      joins(:category).where("categories.name = ?", "aka")
    end
    def sorted
      joins(:category).order("categories.sort_order, categories.name")
    end
  end

  has_many :categories, :through => :tags, :order => "sort_order"

  validates_presence_of :name

  def aliases
    tags.matching("aka").map(&:value)
  end
end
