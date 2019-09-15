module BlogBoi
  class Category < ApplicationRecord
  	#########################
		# Associations
		#########################
  	has_and_belongs_to_many :articles, foreign_key: "blog_boi_article_id", association_foreign_key: "blog_boi_category_id"
  
  	#########################
		# Methods
		#########################
  end
end
