class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name, :null => false
      t.integer :sort_order, :null => false, :default => 100

      t.timestamps
    end
    add_index :categories, [:name], :unique => true

    remove_column :tags, :category
    add_column :tags, :category_id, :integer, :null => true
  end

  def self.down
    remove_column :tags, :category_id
    add_column :tags, :category, :string, :null => false, :default => ""

    remove_index :categories, :name
    drop_table :categories
  end
end
