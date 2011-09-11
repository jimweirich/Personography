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
end
