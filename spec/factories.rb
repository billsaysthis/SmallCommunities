Factory.define :user do |user|
  user.first_name "Johnny"
  user.last_name "Quest"
  user.email "example@example.com"
  user.password "foobar"
  user.password_confirmation "foobar"
  user.url "http://www.example.com"
  user.label "example.com"
  
  user.after_create {|user| user.memberships << Factory(:membership)}
end

Factory.define :membership do |m|
  m.mtype "gold"
  m.year "2011"
end

Factory.define :admin_user, :parent => :user do |user|
  user.is_admin true
end

Factory.define :social_user, :parent => :user do |user|
  user.email 'socialuser@example.com'
  user.twitter "http://twitter.com/#!/example"
  user.facebook "http://facebook.com/#!/example"
  user.linkedin "http://linkedin.com/#!/example"
  user.foursquare "http://foursquare.com/#!/example"
end

Factory.define :event do |event|
  event.title "This is a Title"
  event.occurs_on Date.current + 1.month
  event.status 'on_sale'
  event.page_template "event"
end

Factory.define :setting do |setting|
  setting.name "Setting name"
  setting.value "Setting value"
end