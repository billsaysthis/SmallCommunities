class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table "attendances", :force => true do |t|
      t.references :event
      t.references :member
      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
