module BlogBoi
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    before_action :create_meta_tags_obj

    # TBU
  	def is_admin
  		if true 
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
    	@meta_tags = {}
    end

  end
end
