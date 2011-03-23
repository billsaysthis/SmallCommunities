class CreateNavLinks < ActiveRecord::Migration
  def self.up
    create_table :nav_links do |t|
      t.string :label
      t.string :url
      t.integer :parent_id, :position
      t.boolean :active, :default => true
      t.boolean :is_symbol, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :nav_links
  end
end
