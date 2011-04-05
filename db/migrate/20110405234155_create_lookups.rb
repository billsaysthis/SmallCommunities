class CreateLookups < ActiveRecord::Migration
  def self.up
    create_table :lookups do |t|
      t.string :group
      t.string :value

      t.timestamps
    end
    lookups = ['sidebar_top','sidebar_bottom']
    lookups.each do |pl|
      Lookup.create!({:group => 'photos', :value => pl})
    end
  end

  def self.down
    drop_table :lookups
  end
end
