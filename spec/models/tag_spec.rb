require 'spec_helper'

describe Tag do
  Given(:category) { Category.make }
  Given(:character) { Character.make }
  Given(:tag) { Tag.make(:character => character, :category => category) }

  Then { tag.character.should == character }
  Then { tag.category.should == category }
  Then { tag.name.should == category.name }
end
