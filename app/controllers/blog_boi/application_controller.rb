module BlogBoi
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

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
  end
end
