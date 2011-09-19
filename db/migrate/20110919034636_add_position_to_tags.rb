class AddPositionToTags < ActiveRecord::Migration
  def change
    add_column :tags, :position, :integer, :null => false
  end
end
