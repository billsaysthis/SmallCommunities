class CreateLookupsPhotos < ActiveRecord::Migration
  def self.up
    # drop_table :photo_lookups
    create_table :lookups_photos, :id => false do |t|
      t.references :lookup
      t.references :photo
      t.timestamps
    end
  end

  def self.down
    drop_table :lookups_photos
    # create_table :photo_lookups do |t|
    #   t.string :location
    # end
    # lookups = ['sidebar_top','sidebar_bottom']
    # lookups.each do |pl|
    #   PhotoLookup.create!(:location => pl)
    # end
  end
end
