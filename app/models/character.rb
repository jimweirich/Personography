class Character < ActiveRecord::Base
  has_many :tags, :dependent => :destroy, :order => "position" do
    def matching(cat)
      joins(:category).where("categories.name = ?", "aka")
    end
    def sorted
      joins(:category).order("categories.sort_order, position")
    end
  end

  has_many :categories, :through => :tags, :order => "sort_order"

  validates_presence_of :name

  scope :alphabetically, order(:name)
  scope :recently_changed, order("updated_at DESC")

  def aliases
    tags.matching("aka").map(&:value)
  end

  # Return a list of elements with the form:
  #
  #      [category_name, [value, value ...]]
  #
  # The categories will be listed in sort order and the values will be
  # listed by position
  def category_map
    value_pairs = tags.map { |tag| [tag.category, tag] }.sort
    result = []
    last_cat = nil
    value_pairs.each do |cat, tag|
      if cat == last_cat
        result.last[1] << tag
      else
        result << [cat, [tag]]
        last_cat = cat
      end
    end
    result
  end

  private

  def new_hash_of_arrays
    Hash.new { |h, k| h[k] = [] }
  end
end
