class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.integer :character_id
      t.string :category, :null => false
      t.string :value, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
