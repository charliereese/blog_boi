require "blog_boi/engine"
require "blog_boi/error_classes"

module BlogBoi
  mattr_accessor :author_class, :company_name, :company_logo_path, :company_description, :blog_description,
  	:blog_seo_description, :blog_seo_title

  class << self
		def author_class
		  @@author_class.constantize
		end
  end
  
  ##################
  # Default values
	##################
  
  # Admin class in parent application
  self.author_class = 'Author'
  
  # Company info
  self.company_name = 'SaaSy'
  self.company_description = 'business that does xyz'
  self.company_logo_path = 'blog_boi/logo'

  # Blog info
  self.blog_description = 'We help your business reduce no-shows, get more reviews, and increase sales and productivity: detailed tutorials and insight from business owners and experts'
  self.blog_seo_description = blog_description
  self.blog_seo_title = blog_seo_title
end
