class Category < ActiveRecord::Base
  include Comparable

  has_many :tags
  has_many :characters, :through => :tags

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :sort_order, :only_integer => :true

  def self.sorted
    order("sort_order, name")
  end

  def Category.to_select
    [["-- Select Category --", 0]] +
      order("name").map { |cat| [cat.name, cat.id] }
  end

  scope :alphabetically, order(:name)
  scope :recently_changed, order("updated_at DESC")

  def values
    tags.map(&:value).uniq.sort
  end

  # Returns a list of elements with the following form:
  #
  #    [value, [char1, char2...]]
  #
  # Values will be sorted alphabetically.  Within the character lists,
  # characters will also be sorted alphabetically.
  def value_map
    value_pairs = tags.map { |t| [t.value, t.character] }
    mapping = new_hash_of_arrays
    value_pairs.each do |value, character|
      mapping[value] << character
    end
    mapping.map { |value, characters|
      [value, characters.sort_by { |c| c.name }]
    }.sort
  end

  def <=>(other)
    (sort_order <=> other.sort_order).nonzero? || (name <=> other.name)
  end

  private

  def new_hash_of_arrays
    Hash.new { |h, k| h[k] = [] }
  end
end
