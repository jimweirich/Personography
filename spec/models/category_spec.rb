require 'spec_helper'

describe Category do
  context "factory creates valid categories" do
    Given(:cat) { Category.make }
    Then { cat.should be_valid }
  end

  context "names are unique" do
    Given!(:cat1) { Category.create(:name => "CATNAME") }
    Given(:cat2) { Category.new(:name => "CATNAME") }
    Then { cat2.should_not be_valid }
  end

  describe "values" do
    Given(:char) { Character.make(name:"Char").in_db }
    Given(:cat) { Category.make(name: "cat").in_db }
    Given {
      Tag.make(character:char, category: cat, value: "a").in_db
      Tag.make(character:char, category: cat, value: "a").in_db
      Tag.make(character:char, category: cat, value: "b").in_db
    }
    Then { cat.values.sort.should == ["a", "b"] }
  end

  describe "#value_map" do
    Given(:adam) { Character.new(name: "adam") }
    Given(:bob)  { Character.new(name: "bob") }
    Given(:charlie) { Character.new(name: "charlie") }

    Given(:t1) { Tag.new(character: adam, value: 'a') }
    Given(:t2) { Tag.new(character: bob, value: 'b') }
    Given(:t3) { Tag.new(character: charlie, value: 'b') }

    Given(:cat) { Category.make(name: "group") }
    Given { cat.tags << [t1, t2, t3] }

    When(:map) { cat.value_map }

    Then { map.should == [
        ['a', [adam]],
        ['b', [bob, charlie]],
      ]
    }
  end

  describe "sorting" do
    Given(:cat_a20) { Category.make(name: "A", sort_order: 20) }
    Given(:cat_b10) { Category.make(name: "B", sort_order: 10) }
    Given(:cat_a10) { Category.make(name: "A", sort_order: 10) }

    Then { cat_a10.should < cat_b10 }
    Then { cat_b10.should > cat_a10 }
    Then { cat_a10.should < cat_a20 }
    Then { cat_a20.should > cat_a10 }
  end
end
