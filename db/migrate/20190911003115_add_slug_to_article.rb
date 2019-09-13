class AddSlugToArticle < ActiveRecord::Migration[6.0]
  def change
  	add_column :blog_boi_articles, :slug, :string
  	add_index :blog_boi_articles, :slug, unique: true
  end
end
