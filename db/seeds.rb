# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Basic Settings
Setting.create({:name => 'current_year', :value => Date.current.year.to_s})
Setting.create({:name => 'long_name', :value => 'Small Communities'})
Setting.create({:name => 'short_name', :value => 'SmCom'})
Setting.create({:name => 'corp_name', :value => 'The Small Communities Project Group'})
Setting.create({:name => 'tag_line', :value => 'Manage your community'})
Setting.create({:name => 'copyright', :value => '2011-'})
Setting.create({:name => 'corp_url', :value => 'http://example.org'})
Setting.create({:name => 'corp_email', :value => 'leadership@example.org'})
Setting.create({:name => 'default_location_label', :value => 'Name & Street Address'})
Setting.create({:name => 'default_location_url', :value => 'http://example.com', :is_html => true})
Setting.create({:name => "default_event_title", :value => 'To Be Announced'})
Setting.create({:name => "default_event_description", :value => 'Date is tentative until program is confirmed.'})
Setting.create({:name => "default_event_start_time", :value => '6:30 p.m.'})
# default day to calculate next meeting date if not found in DB
# specify week of month as an in, day of week as string
Setting.create({:name => "default_next_event_date", :value => 'w:2,d:tuesday'})
# Length of regular events in minutes
Setting.create({:name => "event_length", :value => '150'})

Setting.create!({:name => 'google-analytics', :value => 'UA-21971932-1'})
Setting.create!({:name => 'twitter_account', :value => 'billsaysthis'})
Setting.create!({:name => 'mailing_list_url', :value => 'http://groups.yahoo.com/group/JHTCmembers/join'})

Setting.create({:name => 'top_photos_qty', :value => '2'})
Setting.create({:name => 'bottom_photos_qty', :value => '6'})

Setting.create({:name => 'earliest_valid_year', :value => '2006'})
Setting.create({:name => 'has_premium_memberships', :value => '1'})
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

# Initial Pages
StatPage.create({:title => "About", :content1 => 'Replace with your own content', :active => true})
StatPage.create({:title => "Membership", :content1 => 'Replace with your own content', :active => true})

# Admin user
# Please change these defaults!!!
User.create({:last_name => 'Admin', :first_name =>'I.M.', :password => '123456', :email => 'admin@example.com', :is_admin => true, :url => 'http://example.com', :label => 'example.com'})
u = User.find_by_email('admin@example.com')
u.memberships.create(:year => Date.current.year.to_s, :mtype => 'gold')

# Sample Links
Linkage.create({:label => 'about_link', :url => '/about', :position => 1, :link_type => 'nav'})
# following two are showing how to have a sub-menu on the navigation
al = Linkage.find_by_label('about_link')
Linkage.create({:label => 'memberships_link', :url => '/memberships', :position => 1, :parent_id => al.id, :link_type => 'nav'})
Linkage.create({:label => 'past_speakers_link', :url => '/past_speakers', :position => 2, :parent_id => al.id, :link_type => 'nav'})
Linkage.create({:label => 'past_events_link', :url => '/past_events', :position => 2, :link_type => 'nav'})
Linkage.create({:label => 'members_link', :url => '/members', :position => 3, :link_type => 'nav'})
Linkage.create({:label => 'future_events_link', :url => '/upcoming_events', :position => 4, :link_type => 'nav'})
           
Linkage.create({:label => 'facebook_link', :url => 'http://www.facebook.com/group.php?gid=5783743884', :position => 1, :link_type => 'social'})
Linkage.create({:label => 'yahoo_gorups_link', :url => 'http://groups.yahoo.com/group/JHTCmembers', :position => 2, :link_type => 'social'})
Linkage.create({:label => 'twitter_link', :url => 'http://www.twitter.com/billsaysthis', :position => 3, :link_type => 'social'})
Linkage.create({:label => 'linkedin_link', :url => 'http://www.linkedin.com/groups?gid=110955', :position => 4, :link_type => 'social'})
