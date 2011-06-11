class MovePaypalsOutOfEvents < ActiveRecord::Migration
  def self.up
    add_column :paypals, :button_type, :string
    events = Event.all
    regular_event_advance = Setting.retrieve('regular_event_advance').split('$').last
    special_event = Setting.retrieve('special_event').split('$').last
    events.each do |evt|
      if evt.regular_paypal.present?
        evt.paypals << Paypal.create({:button_type => 'regular', :amount => regular_event_advance, :name => evt.title})
      end
      if evt.special_paypal.present?
        evt.paypals << Paypal.create({:button_type => 'special', :amount => special_event, :name => evt.title})
      end
    end
  end

  def self.down
    remove_column :paypals, :button_type
  end
end