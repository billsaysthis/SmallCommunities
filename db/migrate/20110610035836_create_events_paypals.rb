class CreateEventsPaypals < ActiveRecord::Migration
  def self.up
    create_table :events_paypals, :id => false do |t|
      t.references :event
      t.references :paypal
    end
  end

  def self.down
    drop_table :paypals
  end
end
