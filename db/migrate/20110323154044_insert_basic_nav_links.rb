class InsertBasicNavLinks < ActiveRecord::Migration
  def self.up
    al = NavLink.create!({:label => 'about_link', :url => 'about_url', :position => 1})
    NavLink.create!({:label => 'memberships_link', :url => 'memberships_url', :position => 1, :parent_id => al.id})
    NavLink.create!({:label => 'past_speakers_link', :url => 'past_speakers_url', :position => 2, :parent_id => al.id})
    NavLink.create!({:label => 'past_events_link', :url => 'past_events_url', :position => 2})
    NavLink.create!({:label => 'members_link', :url => 'users_url', :position => 3})
    NavLink.create!({:label => 'future_events_link', :url => 'upcoming_events_url', :position => 4})
  end

  def self.down
    NavLink.find_by_label('memberships_link').destroy
    NavLink.find_by_label('about_link').destroy
    NavLink.find_by_label('past_events_link').destroy
    NavLink.find_by_label('members_link').destroy
    NavLink.find_by_label('future_events_link').destroy
  end
end
