class Tag < ActiveRecord::Base
  belongs_to :character
  belongs_to :category

  validates_presence_of :category
  validates_presence_of :value

  def name
    category.name
  end
end
