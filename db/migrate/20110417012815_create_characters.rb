class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
