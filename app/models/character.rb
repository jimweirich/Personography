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

  scope :alphabetically, order(:name)
  scope :recently_changed, order("updated_at DESC")

  def aliases
    tags.matching("aka").map(&:value)
  end
end
