class AddExtrasToLookup < ActiveRecord::Migration
  def self.up
    add_column :lookups, :extras, :string
  end

  def self.down
    remove_column :lookups, :extras
  end
end