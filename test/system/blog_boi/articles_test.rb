require "application_system_test_case"

module BlogBoi
  class ArticlesTest < ApplicationSystemTestCase
  	# A. use the engine's route to get there, rather than the application's one
  	include Engine.routes.url_helpers
 
    setup do
    	@mount_path = '/blog'
      @article = blog_boi_articles(:two)
      # B. use the engine's route to get there, rather than the application's one
      @routes = Engine.routes

      # Log admin back in for other tests
      class ::ApplicationController < ::ActionController::Base
				helper_method :admin_signed_in?
			  def admin_signed_in?
			    true
			  end
			end
    end

    test "visiting the index" do
      visit articles_url
      assert_selector "a", text: "New Article"
    end

    test "creating a hidden Article (which isn't linked on index page)" do
    	title_of_hidden_article = "Article is hidden"

      visit articles_url
      click_on "New Article"

      fill_in "Author name", with: @article.author_name
      fill_in "Title", with: title_of_hidden_article
      check 'Hidden'
      fill_in "Slug", with: 'new slug'
      fill_in "Category names", with: 'hidden-treasure'
      fill_in "Text", with: @article.text

      click_on "Create Article"

      assert_text "Article was successfully created"

      # Article should be visible by admin
      visit articles_url
      assert_text title_of_hidden_article

      # Article should be hidden on category page
      visit @mount_path + '/category/hidden-treasure'
      assert_no_text title_of_hidden_article
    end

    test "updating a Article" do
      visit articles_url
      click_on "Edit", match: :first

      fill_in "Text", with: 'New text'
      fill_in "Title", with: 'New title'
      click_on "Update Article"

      assert_text "Article was successfully updated"
      click_on "Back"
    end

    test "destroying a Article" do
      visit articles_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Article was successfully destroyed"
    end
  end
end
