class AddBasicSettings < ActiveRecord::Migration
  def self.up
    Setting.create({:name => 'current_year', :value => Date.current.year.to_s})
    Setting.create({:name => 'long_name', :value => 'Small Communities'})
    Setting.create({:name => 'short_name', :value => 'SmCom'})
    Setting.create({:name => 'corp_name', :value => 'Long Incorporated Group Name, Inc.'})
    Setting.create({:name => 'tag_line', :value => 'Manage your community'})
    Setting.create({:name => 'copyright', :value => '2011-'})
    Setting.create({:name => 'corp_url', :value => 'http://example.org'})
    Setting.create({:name => 'corp_email', :value => 'leadership@example.org'})
    Setting.create({:name => 'default_location_label', :value => 'Name & Street Address'})
    Setting.create({:name => 'default_location_url', :value => 'http://example.com', :is_html => true})
    Setting.create({:name => "default_event_title", :value => 'To Be Announced'})
    Setting.create({:name => "default_event_description", :value => 'Date is tentative until program is confirmed.'})
    Setting.create({:name => "event_length", :value => '150'})

    Setting.create!({:name => 'google-analytics', :value => 'UA-21971932-1'})
    Setting.create!({:name => 'twitter_account', :value => 'billsaysthis'})
    Setting.create!({:name => 'mailing_list_url', :value => 'http://groups.yahoo.com/group/JHTCmembers/join'})

    Setting.create({:name => 'top_photos_qty', :value => '2'})
    Setting.create({:name => 'bottom_photos_qty', :value => '6'})
    
    Setting.create({:name => 'gold_member_annual', :value => '$500'})
    Setting.create({:name => 'regular_member_annual', :value => '$100'})
    Setting.create({:name => 'renewing_member_annual', :value => '$50'})
    Setting.create({:name => 'student_member_annual', :value => '$75'})
    Setting.create({:name => 'regular_event_advance', :value => '$15'})
    Setting.create({:name => 'regular_event_door', :value => '$20'})
    Setting.create({:name => 'special_event', :value => '$5'})
    Setting.create({:name => 'gold_ppc', :value => 'PayPal button code'})
    Setting.create({:name => 'regular_ppc', :value => 'PayPal button code'})
    Setting.create({:name => 'renewing_ppc', :value => 'PayPal button code'})
    Setting.create({:name => 'student_ppc', :value => 'PayPal button code'})
  end

  def self.down
    Setting.find_by_name('current_year').destroy
    Setting.find_by_name('long_name').destroy
    Setting.find_by_name('short_name').destroy
    Setting.find_by_name('corp_name').destroy
    Setting.find_by_name('tag_line').destroy
    Setting.find_by_name('copyright').destroy
    Setting.find_by_name('corp_url').destroy
    Setting.find_by_name('corp_email').destroy
    Setting.find_by_name('default_location_label').destroy
    Setting.find_by_name('default_location_url').destroy
    Setting.find_by_name("default_event_title").destroy
    Setting.find_by_name("default_event_description").destroy
    Setting.find_by_name("event_length").destroy

    Setting.find_by_name('google-analytics').destroy
    Setting.find_by_name!'twitter_account').destroy
    Setting.find_by_name!'mailing_list_url').destroy

    Setting.find_by_name('top_photos_qty').destroy
    Setting.find_by_name('bottom_photos_qty').destroy
    
    Setting.find_by_name('gold_member_annual').destroy
    Setting.find_by_name('regular_member_annual').destroy
    Setting.find_by_name('renewing_member_annual').destroy
    Setting.find_by_name('student_member_annual').destroy
    Setting.find_by_name('regular_event_advance').destroy
    Setting.find_by_name('regular_event_door').destroy
    Setting.find_by_name('special_event').destroy
    Setting.find_by_name('gold_ppc').destroy
    Setting.find_by_name('regular_ppc').destroy
    Setting.find_by_name('renewing_ppc').destroy
    Setting.find_by_name('student_ppc').destroy
  end
end
