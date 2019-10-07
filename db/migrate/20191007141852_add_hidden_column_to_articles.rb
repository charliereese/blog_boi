class AddHiddenColumnToArticles < ActiveRecord::Migration[6.0]
  def change
  	add_column :blog_boi_articles, :hidden, :boolean
  	add_index :blog_boi_articles, :hidden
  end
end
