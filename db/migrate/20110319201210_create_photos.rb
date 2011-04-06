class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photo_lookups do |t|
      t.string :location
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
