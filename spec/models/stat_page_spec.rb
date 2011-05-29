require 'spec_helper'

describe StatPage do
  it "should require a title" do
    no_title_stat_page = StatPage.new({:content_block => 'Some content', :active => true})
    no_title_stat_page.should_not be_valid
  end
  
  it "should require the title is unique" do
    first_stat_page = StatPage.create!({:title => 'A Title', :content_block => 'Some content', :active => true})
    duplicate_title_stat_page = StatPage.new({:title => 'A Title', :content_block => 'Some content', :active => true})
    duplicate_title_stat_page.should_not be_valid
  end
  
  it "should require content_block" do
    no_content_block_stat_page = StatPage.new({:title => 'A Title', :active => true})
    no_content_block_stat_page.should_not be_valid
  end
  
  it "should accept valid static pages" do
    first_stat_page = StatPage.new({:title => 'First Page Title', :content_block => 'Some content', :active => true})
    first_stat_page.should be_valid
    first_stat_page.save
    
    second_stat_page = StatPage.new({:title => 'Second Page Title', :content_block => 'Some content', :active => true})
    second_stat_page.should be_valid
  end
end
