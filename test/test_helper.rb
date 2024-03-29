# Keep it on top, don't change positions
require 'codeclimate-test-reporter'
require 'simplecov'
require 'coveralls'

# Don't forget set token
CodeClimate::TestReporter.start

Coveralls.wear! if Coveralls.should_run?
# Coveralls.wear!('rails') # For RailsApp

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require 'tuberack'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

require 'capybara/rails' # Capybara must be required directly          

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

include Tuberack::Helpers

class ActiveSupport::TestCase
  # Uncomment if are you using Rails engine
  include Nav::Engine.routes.url_helpers
  # include Rails.application.routes.url_helpers
end

WebMock.disable_net_connect! allow: %w(coveralls.io)