class InsertBasicLinks < ActiveRecord::Migration
  def self.up
    al = Link.create!({:label => 'about_link', :url => 'about_url', :position => 1, :link_type => 'nav'})
    Link.create!({:label => 'memberships_link', :url => 'memberships_url', :position => 1, :parent_id => al.id, :link_type => 'nav'})
    Link.create!({:label => 'past_speakers_link', :url => 'past_speakers_url', :position => 2, :parent_id => al.id, :link_type => 'nav'})
    Link.create!({:label => 'past_events_link', :url => 'past_events_url', :position => 2, :link_type => 'nav'})
    Link.create!({:label => 'members_link', :url => 'users_url', :position => 3, :link_type => 'nav'})
    Link.create!({:label => 'future_events_link', :url => 'upcoming_events_url', :position => 4, :link_type => 'nav'})

    Link.create!({:label => 'facebook_link', :url => 'http://www.facebook.com/group.php?gid=5783743884', :position => 1, :link_type => 'social'})
    Link.create!({:label => 'yahoo_gorups_link', :url => 'http://groups.yahoo.com/group/JHTCmembers', :position => 2, :link_type => 'social'})
    Link.create!({:label => 'twitter_link', :url => 'http://www.twitter.com/billsaysthis', :position => 3, :link_type => 'social'})
    Link.create!({:label => 'linkedin_link', :url => 'http://www.linkedin.com/groups?gid=110955', :position => 4, :link_type => 'social'})
  end

  def self.down
    Link.find_by_label('memberships_link').destroy
    Link.find_by_label('about_link').destroy
    Link.find_by_label('past_events_link').destroy
    Link.find_by_label('members_link').destroy
    Link.find_by_label('future_events_link').destroy

    Link.find_by_label('facebook_link').destroy
    Link.find_by_label('yahoo_gorups_link').destroy
    Link.find_by_label('twitter_link').destroy
    Link.find_by_label('linkedin_link').destroy
  end
end
