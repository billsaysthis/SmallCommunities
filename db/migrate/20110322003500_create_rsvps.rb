class CreateRsvps < ActiveRecord::Migration
  def self.up
    create_table "rsvps", :force => true do |t|
      t.references :event
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :rsvps
  end
end
