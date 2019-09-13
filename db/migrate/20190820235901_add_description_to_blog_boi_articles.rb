class AddDescriptionToBlogBoiArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_boi_articles, :description, :string
  end
end
