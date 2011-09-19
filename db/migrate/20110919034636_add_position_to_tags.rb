class AddPositionToTags < ActiveRecord::Migration
  def change
    add_column :tags, :position, :integer, :null => false, :default => 0
  end
end
