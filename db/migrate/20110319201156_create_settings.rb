class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings, :force => true do |t|
      t.string  :name
      t.text    :value
      t.boolean :is_html, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
