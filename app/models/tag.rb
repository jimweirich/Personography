class Tag < ActiveRecord::Base
  belongs_to :character
  belongs_to :category
  acts_as_list :scope => :character

  validates_presence_of :category
  validates_presence_of :value

  def name
    category.name
  end

  def <=>(other)
    position <=> other.position
  end
end
