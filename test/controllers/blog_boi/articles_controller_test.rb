require 'test_helper'
require 'byebug'

module BlogBoi
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
  	# A. use the engine's route to get there, rather than the application's one
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      # B. use the engine's route to get there, rather than the application's one
      @article = blog_boi_articles(:one)
      @article.image.attach(create_file_blob)
      @author = users(:one)
    end

    test "should get index" do
      get articles_url
      assert_response :success

      meta_tag_image = css_select('meta[property="og:image"]')
      assert meta_tag_image.attribute('content').value.present?
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
        post articles_url, params: { 
        	article: { 
        		text: 'Cool new story', 
        		title: 'Title thing',
        		hidden: true,
        		author_name: 'Charlie Reese',
        		category_names: 'stuff A, stuff B',
        		description: 'Great description of article',
        		slug: 'cool-new-article'
        	} 
        }
      end

      assert_redirected_to article_url(Article.last.slug)
    end

    test "should show article" do
      get article_url(@article.slug)
      assert_response :success

      meta_tag_description = css_select('meta[name="description"]')
      assert_equal meta_tag_description.attribute('content').value, @article.description
    
      meta_tag_image = css_select('meta[property="og:image"]')
      assert meta_tag_image.attribute('content').value.present?
    end

    test "should get edit" do
      get edit_article_url(@article)
      assert_response :success
    end

    test "should update article" do
      patch article_url(@article), params: { 
      	article: { 
      		text: 'Cool new story', 
      		title: 'Title thing',
      		author_name: 'Charlie Reese',
      		category_names: 'stuff A, stuff B',
      		description: 'Great description of article',
      		slug: 'cool-new-article'
      	} 
      }
      assert_redirected_to article_url('cool-new-article')
    end

    test "should destroy article" do
      assert_difference('Article.count', -1) do
        delete article_url(@article)
      end

      assert_redirected_to articles_url
    end
  end
end
