module BlogBoi
  module ArticlesHelper
  	def str_of_authors
  		BlogBoi.author_class.all.pluck(:name).join(',')
  	end
  end
end
