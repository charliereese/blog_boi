# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

# Use reporters for prettier tests
require "minitest/reporters"
Minitest::Reporters.use!

begin
	Rails.application.configure do
  	# Disable request forgery protection in test environment.
  	config.action_controller.allow_forgery_protection = false
	end
rescue NameError
	puts "Rails constant not loaded for system tests"
end

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../db/migrate', __dir__)
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new


# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end


# Helpers for tests
module TestHelpers
	
end


class ActiveSupport::TestCase
  setup do
		# Define global setup and teardown methods
  end
end