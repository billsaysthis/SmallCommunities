source 'http://rubygems.org'

gem 'rails', '~>3.1.1'

# gem 'mysql2'

gem "configatron"
gem "haml-rails", ">= 0.2"
gem "devise", ">=1.1.2"
gem "rails_admin", :git => 'git://github.com/sferik/rails_admin.git'
gem "ice_cube"
gem "icalendar"
gem "haml", ">= 3.1.0.alpha.145"
#gem "compass-lucid-grid"
gem 'oily_png'
gem "hpricot"
gem 'jquery-rails', '>= 0.2.6'
gem "ruby_parser"
gem 'rack-recaptcha', :require => 'rack/recaptcha'
gem 'simple-navigation'
gem "addressable"

group :assets do
  gem "uglifier"
  gem "sass-rails"
  gem "compass", ">= 0.12.alpha.0"
end

group :development, :test do
  # To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
  # gem 'ruby-debug'
  gem "sqlite3"
  gem 'ruby-debug19'
  gem "rspec-rails", ">=2.0.1"
  gem 'webrat'
end

group :test do
  gem "rspec", ">=2.0.1"
  gem "cucumber", ">=0.6.3"
  gem "cucumber-rails", ">=0.3.2"
  gem "capybara", ">=0.3.6"
  gem "database_cleaner", ">=0.5.0"
  gem "factory_girl_rails"
end

group :production do
  gem "pg"
  gem "thin"
end
