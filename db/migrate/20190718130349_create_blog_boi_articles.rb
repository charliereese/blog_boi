class CreateBlogBoiArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_boi_articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
