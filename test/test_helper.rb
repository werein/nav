require 'simplecov'

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'

# MiniTest for Rails
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'

# Stubbing and mocking
require 'mocha/setup'

require 'factories'
require 'testable'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# # Load fixtures from the engine
# # if ActiveSupport::TestCase.method_defined?(:fixture_path=)
# #   ActiveSupport::TestCase.fixture_path = File.expand_path('../fixtures', __FILE__)
# # end

include Testable::Helpers

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  include Capybara::DSL
  include Capybara::Assertions

  include Nav::Engine.routes.url_helpers

  if defined? Warden
    include Warden::Test::Helpers
    Warden.test_mode!
  end
end