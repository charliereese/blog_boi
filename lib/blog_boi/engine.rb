module BlogBoi
  class Engine < ::Rails::Engine
    isolate_namespace BlogBoi

    require 'bootstrap'
    require 'jquery-rails'
    require 'rails-ujs'


		initializer "blog_boi.assets.precompile" do |app|
			app.config.assets.precompile += %w( blog_boi/logo.png blog_boi/star.svg )
		end
  end
end
