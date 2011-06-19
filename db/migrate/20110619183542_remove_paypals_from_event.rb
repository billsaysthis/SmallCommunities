class RemovePaypalsFromEvent < ActiveRecord::Migration
  def self.up
    remove_column :events, :regular_paypal
    remove_column :events, :special_paypal
  end

  def self.down
    add_column :events, :regular_paypal, :string
    add_column :events, :special_paypal
  end
end
