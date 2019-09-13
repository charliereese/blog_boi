source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem's dependencies in blog_boi.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'

  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'

  # Use Puma as the app server
	gem 'puma', '~> 3.11'

	# For testing
	gem 'byebug'
	gem 'minitest-reporters'
end

# To use a debugger
# gem 'byebug', group: [:development, :test]
