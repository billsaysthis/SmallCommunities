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

### Theming and Text Customization

In order to easily customize appearance to match a group's visual branding, 
Small Communities has a skin system.

Additionally, Small Communities uses Rails' I18N facilities to manage strings 
displayed so you may edit the provided English file and add other languages as 
useful.

## Getting Started

1. At the command prompt, clone the Small Communities repo on GitHub:

      git clone <Small Communities URL>

2. Change directory to small_communities, install the bundle:

      cd small_communities; bundle install

3. Setup and create the database:

      edit config/database.yml
      rake db:create

4. Edit the configuration migrations:

      edit db/migrations/<timestamp>_add_basic_settings.rb
      edit db/migrations/<timestamp>_insert_basic_links.rb

5. Start the Rails server and load the app in your browser to confirm a valid install:

      rails s
      http://localhost:3000

5. Basic Setup and Customization

* customize your theme
* create your "static" pages
* edit the Mailer configuration in config/initializers/sc_mailer.rb
* edit (or add) the locale file for your language in config/locales

## Contributing

### Contributors

- Bill Lazar (billsaysthis) - maintainer


### Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

#### Copyright

Copyright (c) 2011 Bill Lazar, http://billlazar.com. See LICENSE for details.