class AddStatusToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :status, :string, :default => 'on_sale'
  end

  def self.down
    remove_column :events, :status
  end
end