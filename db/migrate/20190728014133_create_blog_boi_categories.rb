class CreateBlogBoiCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_boi_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
