class CreateSpeakersAndPresentations < ActiveRecord::Migration
  def self.up
    create_table :speakers, :force => true do |t|
      t.string   "name",       :null => false
      t.string   "url"
      t.text     "bio"
      t.string   "image_url"
      t.timestamps
    end

    create_table "presentations", :force => true do |t|
      t.references  :event
      t.references  :speaker
      t.string     :presentation_url
      t.timestamps
    end
  end

  def self.down
    drop_table :speakers
    drop_table :presentations
  end
end