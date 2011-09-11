class Category < ActiveRecord::Base
  has_many :tags
  has_many :characters, :through => :tags

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :sort_order, :only_integer => :true

  def self.sorted
    order("sort_order, name")
  end

  def Category.to_select
    [["-- Select Category --", 0]] +
      order("name").map { |cat| [cat.name, cat.id] }
  end

  scope :alphabetically, order(:name)
  scope :recently_changed, order("updated_at DESC")

  def values
    tags.map(&:value).uniq.sort
  end
end
