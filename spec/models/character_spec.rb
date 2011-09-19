require 'spec_helper'

describe Character do
  Given(:default_attrs) { { :name => "Name" } }
  Given(:character) { Character.new(default_attrs) }

  describe "requires a name" do
    Given(:character) { Character.new(default_attrs.merge(:name => nil)) }
    Then {
      character.should be_invalid_on(:name, message: /blank/i)
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

  describe "category_map" do
    Given(:bob)   { Character.new(name: "bob") }
    Given(:group) { Category.make(name: "group", sort_order: 10) }
    Given(:from)  { Category.make(name: "from",  sort_order: 20) }

    Given(:t1) { Tag.new(category: group, value: 'A', position: 2) }
    Given(:t2) { Tag.new(category: group, value: 'B', position: 1) }
    Given(:t3) { Tag.new(category: from,  value: 'F', position: 1) }

    Given { bob.tags << [t1, t2, t3] }

    When(:mapping) { bob.category_map }

    Then {
      mapping.should == [
        [group, [t2, t1]],
        [from, [t3]],
      ]
    }
  end

end
