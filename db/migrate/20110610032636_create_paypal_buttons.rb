class CreatePaypalButtons < ActiveRecord::Migration
  def self.up
    create_table :paypals, :force => true do |t|
      t.string :name
      t.decimal :amount
      t.string :guid
      t.timestamps
    end    
  end

  def self.down
    drop_table :events_paypals
  end
end