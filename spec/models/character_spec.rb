require 'spec_helper'

describe Character do
  Given(:default_attrs) { { :name => "Name" } }
  Given(:character) { Character.new(default_attrs) }

  describe "requires a name" do
    Given(:character) { Character.new(default_attrs.merge(:name => nil)) }
    Then {
      character.should be_invalid_on(:name, /blank/i)
    }
  end

  context "with" do
    Given(:aka) { Category.new(:name => "aka") }
    Given(:group) { Category.new(:name => "group") }
    Given { character.tags.new(:value => "John", :category => aka) }
    Given { character.tags.new(:value => "Ashaman", :category => group) }

    context "tags" do
      Given(:tag_names) { character.tags.map(&:name).sort }
      Given(:tag_values) { character.tags.sort_by { |t| t.name }.map(&:value) }

      Then { tag_names.should == ["aka", "group"] }
      Then { tag_values.should == ["John", "Ashaman"] }
    end

    context "saved to db" do
      Given { group.save; aka.save; character.save }
      Given(:actual_groups) { character.categories.map(&:name).sort }

      Then { actual_groups.should == ["aka", "group"] }
      Then { character.aliases.should == ["John"] }
    end
  end
end
