require 'simplecov'

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'
require 'testable'
require 'capybara/rails'
include Testable::Helpers

# Load factories
Dir["#{File.dirname(__FILE__)}/factories/*.rb"].each { |f| require f }

Rails.backtrace_cleaner.remove_silencers!

class ActiveSupport::TestCase
  include Nav::Engine.routes.url_helpers
  include Rails.application.routes.url_helpers
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end