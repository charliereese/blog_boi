require 'kramdown'

module BlogBoi
  class Article < ApplicationRecord
  	attr_writer :category_names, :author_name
  	
  	#########################
		# Associations
		#########################

  	has_many :comments
  	has_and_belongs_to_many :categories, foreign_key: "blog_boi_category_id", association_foreign_key: "blog_boi_article_id"
		belongs_to :author, class_name: BlogBoi.author_class.to_s
		has_one_attached :image
		
		#########################
		# Before hooks
		#########################

		before_validation :set_author, :set_categories

		#########################
		# Scopes
		#########################
		
		scope :with_category_name, lambda { |category_name| 
			joins(:categories).merge(Category.where({name: category_name}))
		}

		#########################
		# Methods
		#########################

		def read_time
			length = (self.text.split.length / 200.0).ceil.to_s
			
			if length != '1'
				length + " minutes"
			else
				length + " minute"
			end
		end

		def author_name
			@author_name || author && author.name || nil
		end

		def category_names
			@category_names || categories.pluck(:name).join(', ')
		end

		def markdown_text
			Kramdown::Document.new(text).to_html
		end

		private

		def set_author
	    self.author = BlogBoi.author_class.find_or_create_by(name: author_name)
	  end

	  def set_categories
	  	self.categories = []

	  	category_names.split(', ').each do |category_name|
	  		self.categories << Category.find_or_create_by(name: category_name)
	  	end
	  end
  end
end