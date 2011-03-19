class AddGoogleAnalyticsSetting < ActiveRecord::Migration
  def self.up
    Setting.create!({:name => 'google-analytics', :value => 'UA-21971932-1'})
  end

  def self.down
    Setting.find_by_name('google-analytics').destroy
  end
end
