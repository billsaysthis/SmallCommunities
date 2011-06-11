class EventsPaypal < ActiveRecord::Base
  belongs_to :paypal
  belongs_to :event
end