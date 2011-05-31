# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

# following block is necessary for Rake 0.9 breakage
class Rails::Application
  include Rake::DSL if defined?(Rake::DSL)
end

SmallCommunities::Application.load_tasks
