require 'byebug'

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

  	# TBU
  	def is_admin
  		true
  	end
  
  	def controller_action
  		action_name
  	end

  end

end
