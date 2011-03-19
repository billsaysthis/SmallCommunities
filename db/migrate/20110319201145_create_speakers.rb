class CreateSpeakers < ActiveRecord::Migration
  def self.up
    create_table :speakers, :force => true do |t|
      t.string :name
      t.string :url, :image_url
      t.text :bio
      t.timestamps
    end
    
    create_table :presentations, :force => true do |t|
      t.references :event
      t.references :speaker
      t.string :presentation_url
      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
    drop_table :speakers
  end
end