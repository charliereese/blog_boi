module BlogBoi
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    before_action :create_meta_tags_obj

    # TBU
  	def authenticate_admin
  		if !defined?(admin_signed_in?) 
  			raise BlogBoi::MethodNotImplementedByParentApplication, "admin_signed_in?"
  		elsif admin_signed_in?
  			true
  		else
  			redirect_to root_path
  		end
  	end

    protected

    def set_categories
    	@categories = Category.all
    end

    def create_meta_tags_obj
    	@meta_tags = {
    		image: helpers.image_url(BlogBoi.blog_meta_image)
    	}
    end

  end
end
