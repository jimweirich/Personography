class Category < ActiveRecord::Base
  has_many :tags

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :sort_order, :only_integer => :true

  def Category.to_select
    [["-- Select Category --", 0]] +
      order("name").map { |cat| [cat.name, cat.id] }
  end
end
