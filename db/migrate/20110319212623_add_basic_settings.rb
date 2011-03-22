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
  end
end
