class CreateJoinTableArticleCategory < ActiveRecord::Migration[5.2]
  def change
    create_join_table :blog_boi_articles, :blog_boi_categories do |t|
      t.index [:article_id, :category_id], name: 'index_blog_boi_article_id_category_id'
      t.index [:category_id, :article_id], name: 'index_blog_boi_category_id_article_id'
    end
  end
end
