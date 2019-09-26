class CreateJoinTableArticleCategory < ActiveRecord::Migration[5.2]
  def change
    create_join_table :blog_boi_articles, :blog_boi_categories do |t|
      t.index [:blog_boi_article_id, :blog_boi_category_id], name: 'index_blog_boi_article_id_category_id'
      t.index [:blog_boi_category_id, :blog_boi_article_id], name: 'index_blog_boi_category_id_article_id'
    end
  end
end
