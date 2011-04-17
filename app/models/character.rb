class Character < ActiveRecord::Base
  has_many :tags, :order => "category, value", :dependent => :destroy
end
