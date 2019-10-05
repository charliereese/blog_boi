module BlogBoi
	
	class MethodNotImplementedByParentApplication < ::StandardError
  	attr_reader :method_missing

  	def initialize(method)
    	@method_missing = method

    	super(
    		'Parent application must implement the method ' + 
    		method_missing + 
    		" - See BlogBoi README for requirement."
    	)
  	end
	
	end

end