require "application_system_test_case"

module BlogBoi
  class ArticlesAdminLoggedOutTest < ApplicationSystemTestCase
  	# A. use the engine's route to get there, rather than the application's one
  	include Engine.routes.url_helpers
 
    setup do
      @article = blog_boi_articles(:one)
      # B. use the engine's route to get there, rather than the application's one
      @routes = Engine.routes
      
      # Parent App admin_signed_in? returns false
      # Because admin is logged out
      class ::ApplicationController < ::ActionController::Base
				helper_method :admin_signed_in?
			  def admin_signed_in?
			    false
			  end
			end
    end

    test "Link to create new article missing" do
      visit articles_url
      assert_no_selector "a", text: "New Article"
    end

    test "Linke to update Article missing" do
      visit articles_url
      assert_no_selector "a", text: "Edit"
    end

    test "Link to destroy Article missing" do
      visit articles_url
     	assert_no_selector "a", text: "Destroy"
    end
  end
end
