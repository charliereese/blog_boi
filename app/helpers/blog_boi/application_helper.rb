module BlogBoi
  
  module ApplicationHelper
  	
  	# Iterates over BlogBoi module class variables
  	# and creates helper methods for them

  	BlogBoi.class_variables.each do |class_var|
  	
  		mattr_name = class_var.to_s[2..-1]

  		define_method(mattr_name) do
  			BlogBoi.send(mattr_name)
  		end

  	end

  	def is_admin?
  		if defined?(admin_signed_in?) 
  			admin_signed_in?
  		else
  			raise BlogBoi::MethodNotImplementedByParentApplication, "admin_signed_in?"
  		end
  	end
  
  	def controller_action
  		action_name
  	end

  end

end
