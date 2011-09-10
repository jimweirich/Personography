require 'spec_helper'

describe Tag do
  Given(:category) { Category.new(:name => "group") }
  Given(:character) { Character.new(:name => "Bob") }
  Given(:tag) { Tag.new(:character => character, :category => category) }

  Then { tag.character.should == character }
  Then { tag.category.should == category }
  Then { tag.name.should == category.name }
end
