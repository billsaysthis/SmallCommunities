## Welcome to Small Communities

Small Communities is an application built on Ruby on Rails to drive websites 
for small groups. The central concepts of the app are Members and Events with 
Speakers. An administrator backend is provided through the RailsAdmin gem.

Events are available directly as well as on an upcoming calendar and a listing 
of past events. Members can RSVP for events and non-members can purchase 
tickets. A Memberships page provides links for purchasing annual memberships.

By default purchases are through simple PayPal Buy Now buttons and memberships 
include admission to regular events.

There are also facilities for simple "static" pages, such as About and Contact.

## Technical Overview

Small Communities uses Rails 3; Rails 2 support is precluded by use of certain 
framework methods and gems not available in Rails 2.

### Core gems

* Devise for authentication
* Compass, Sass and Haml for views and programmable CSS
* jQuery Rails to provide jQuery-based JavaScript helpers
* IceCube and iCalendar for calendaring
* RailsAdmin for automatic admin backend
* RSpec and Cucumber for tests
* Configatron for configuration file support
* Rack-Recaptcha for repatchas
* [mmmenu](https://github.com/snitko/mmmenu) for the Navigation menu
* Rails_uri_validator and Rails_uri_validator

### Theming and Text Customization

In order to easily customize appearance to match a group's visual branding, 
Small Communities has a skin system.

Additionally, Small Communities uses Rails' I18N facilities to manage strings 
displayed so you may edit the provided English file and add other languages as 
useful.

## Getting Started

Clone the SmallCommunities GitHub repo:

<pre>   git clone git://github.com/billsaysthis/SmallCommunities.git</pre>

Change to the app directory and install the bundle:

<pre>   cd small_communities
   bundle install</pre>

Setup and create the database, run the migrations:

<pre>   edit config/database.yml
   rake db:create
   rake db:migrate</pre>

Edit the English locale file, or prepare the one for your language:

<pre>   edit config/locales/en.yml</pre>

_Note:_ You may want to review the RailsAdmin and Devise locale files for your language.

Edit the Mailer and AppConfig initializers:

<pre>   edit config/initializers/sc_mailer.rb
   edit config/initializers/app_config.yml</pre>

Edit the seeds file and run the rake task:

<pre>   edit db/seeds.rb
   rake db:seed</pre>

_Note:_ The About and Memberships page titles make use of the locale file

### Confirm a valid install:

Start the Rails server and load the app in your browser:

<pre>   rails s
   http://localhost:3000</pre>

### Customize Appearance and Finetune Settings

* Customize your theme by editing the SCSS files in app/stylesheets
* Review the basic settings in the Settings tab of the Admin backend
* Edit/create your "static" pages in the Pages tab of the Admin backend

## Contributing

### Contributors

- Bill Lazar [billsaysthis](http://github.com/billsaysthis) - maintainer
- Steve Morris [stevemorris](http://github.com/stevemorris)

### Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

#### Copyright

Copyright (c) 2011 Bill Lazar, [http://billlazar.com](http://billlazar.com). See LICENSE for details.