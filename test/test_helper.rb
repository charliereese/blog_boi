# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

# Use reporters for prettier tests
require "minitest/reporters"
Minitest::Reporters.use!

# Use simplecov for test coverage
require 'simplecov'
SimpleCov.start 'rails'
# SimpleCov.minimum_coverage_by_file 80

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

  # ported from https://github.com/rails/rails/blob/4a17b26c6850dd0892dc0b58a6a3f1cce3169593/activestorage/test/test_helper.rb#L52
  def create_file_blob(filename: "image.jpg", content_type: "image/jpeg", metadata: nil)
    ActiveStorage::Blob.create_after_upload! io: file_fixture(filename).open, filename: filename, content_type: content_type, metadata: metadata
  end
end