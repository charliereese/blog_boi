class AddAuthorIdToBlogBoiArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_boi_articles, :author_id, :integer
  end
end
