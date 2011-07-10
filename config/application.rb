require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module SmallCommunities
  class Application < Rails::Application
    config.encoding = "utf-8"

    config.generators do |g|
      g.template_engine :haml
      g.test_framework  :rspec, :fixture => true, :views => false
      g.integration_tool :rspec, :fixture => true, :views => true
    end
    config.action_view.javascript_expansions[:defaults] = %w(jquery.min rails jquery.jtweetsanywhere-1.2.1.min)
    config.filter_parameters += [:password]
    asf = File.expand_path('../initializers/app_config.rb', __FILE__)
    configatron.configure(asf)
  end
end
