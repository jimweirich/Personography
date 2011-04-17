class Tag < ActiveRecord::Base
  belongs_to :character

  validates_presence_of :category
  validates_presence_of :value
end
