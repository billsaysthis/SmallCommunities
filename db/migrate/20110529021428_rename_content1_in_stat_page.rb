class RenameContent1InStatPage < ActiveRecord::Migration
  def self.up
    rename_column :stat_pages, :content1, :content_block
    remove_column :stat_pages, :content2
    remove_column :stat_pages, :content3
    remove_column :stat_pages, :content4
    remove_column :stat_pages, :content5
  end

  def self.down
    rename_column :stat_pages, :content_block, :content1
  end
end