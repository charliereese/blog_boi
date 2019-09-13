require 'test_helper'
require 'byebug'

module BlogBoi
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
  	# A. use the engine's route to get there, rather than the application's one
    include Engine.routes.url_helpers

    setup do
      @article = blog_boi_articles(:one)
      @author = users(:one)
      # B. use the engine's route to get there, rather than the application's one
      @routes = Engine.routes
    end

    test "should get index" do
      get articles_url
      assert_response :success
    end

    test "should get index - custom company name" do
    	BlogBoi.company_name = "New Company Name"
      get articles_url
      assert_select "a", "New Company Name"
    end

    test "should get index - custom logo path" do
    	BlogBoi.company_logo_path = 'blog_boi/logo'
      get articles_url
      assert_response :success
    end

    test "should get new" do
      get new_article_url
      assert_response :success
    end

    test "should create article" do
      assert_difference('Article.count') do
        post articles_url, params: { article: { text: @article.text, title: @article.title } }
      end

      assert_redirected_to article_url(Article.last)
    end

    test "should show article" do
      get article_url(@article)
      assert_response :success
    end

    test "should get edit" do
      get edit_article_url(@article)
      assert_response :success
    end

    test "should update article" do
      patch article_url(@article), params: { article: { text: @article.text, title: @article.title } }
      assert_redirected_to article_url(@article)
    end

    test "should destroy article" do
      assert_difference('Article.count', -1) do
        delete article_url(@article)
      end

      assert_redirected_to articles_url
    end
  end
end
