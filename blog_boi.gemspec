$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "blog_boi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "blog_boi"
  spec.version     = BlogBoi::VERSION
  spec.authors     = ["Charlie Reese"]
  spec.email       = ["j.charles.reese@gmail.com"]
  spec.homepage    = "https://github.com/charliereese/blog_boi"
  spec.metadata    	 = { "source_code_uri" => "https://github.com/charliereese/blog_boi" }
  spec.summary     = "BlogBoi is a rails engine for adding blogging functionality to your rails project."
  spec.description = "Easily add blogging functionality to your rails project using BlogBoi. WARNING: v0.0.1 and v0.0.2 are not yet stable / production ready."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "kramdown", '~> 2.1', '>= 2.1.0'
  spec.add_dependency "rails", '~> 6.0', '>= 6.0.0'
  spec.add_dependency 'bootstrap', '~> 4.3'
  spec.add_dependency 'jquery-rails', '~> 4.3', '>= 4.3.3'
  spec.add_dependency 'rails-ujs', '~> 0.1.0'

  spec.add_development_dependency "sqlite3", '~> 0'
end
