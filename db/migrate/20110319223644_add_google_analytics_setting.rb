class AddGoogleAnalyticsSetting < ActiveRecord::Migration
  def self.up
    Setting.create!({:name => 'google-analytics', :value => 'UA-21971932-1'})
    Setting.create!({:name => 'tagline', :value => 'Educate. Inform. Connect.'})
    Setting.create!({:name => 'twitter_account', :value => 'JHTCsv'})
    Setting.create!({:name => 'mailing_list_url', :value => 'http://groups.yahoo.com/group/JHTCmembers/join'})
  end

  def self.down
    Setting.find_by_name('google-analytics').destroy
    Setting.find_by_name('tagline').destroy
    Setting.find_by_name('twitter_account').destroy
    Setting.find_by_name('mailing_list_url').destroy
  end
end
