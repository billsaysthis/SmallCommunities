class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :linkages, :force => true do |t|
      t.string :label
      t.string :url
      t.string :link_type
      t.integer :parent_id, :position
      t.boolean :active, :default => true
      t.boolean :is_symbol, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :linkages
  end
end
