class AdditionalUserFields < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :joined_on, :datetime
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :phone, :string
    add_column :users, :url, :string
    add_column :users, :logo, :string
    add_column :users, :label, :string
    add_column :users, :linkedin, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :foursquare, :string
    add_column :users, :volunteer_title, :string
  end

  def self.down
  end
end
