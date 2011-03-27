class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :stat_pages do |t|
      t.string :title
      # yes, not normalized, we know :)
      t.text :content1
      t.text :content2
      t.text :content3
      t.text :content4
      t.text :content5
      t.boolean :show_sponsors
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :stat_pages
  end
end
