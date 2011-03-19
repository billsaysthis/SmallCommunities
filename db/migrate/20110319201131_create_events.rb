class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events, :force => true do |t|
      t.string :title
      t.string :subtitle, :location
      t.datetime :occurs_on
      t.text :description
      t.string :regular_paypal, :special_paypal, :special_pricing
      t.boolean :show_sponsors, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
