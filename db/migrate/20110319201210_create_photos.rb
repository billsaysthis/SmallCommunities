class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photo_lookups do |t|
      t.string :location
    end
    lookups = ['sidebar_top','sidebar_bottom']
    lookups.each do |pl|
      PhotoLookup.create!(:location => pl)
    end
    
    create_table :photos do |t|
      t.string :filename
      t.boolean :active
      t.references :photo_lookup
      t.string :caption

      t.timestamps
    end
  end
  
  def self.down
    drop_table :photos
  end
end
