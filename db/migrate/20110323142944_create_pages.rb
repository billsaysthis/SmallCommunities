class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.boolean :show_sponsors
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
