require "application_system_test_case"

module BlogBoi
  class ArticlesTest < ApplicationSystemTestCase
  	# A. use the engine's route to get there, rather than the application's one
  	include Engine.routes.url_helpers
 
    setup do
      @article = blog_boi_articles(:one)
      # B. use the engine's route to get there, rather than the application's one
      @routes = Engine.routes
    end

    test "visiting the index" do
      visit articles_url
      assert_selector "a", text: "New Article"
    end

    test "creating a Article" do
      visit articles_url
      click_on "New Article"

      fill_in "Text", with: @article.text
      fill_in "Title", with: @article.title
      click_on "Create Article"

      assert_text "Article was successfully created"
      click_on "Back"
    end

    test "updating a Article" do
      visit articles_url
      click_on "Edit", match: :first

      fill_in "Text", with: @article.text
      fill_in "Title", with: @article.title
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
