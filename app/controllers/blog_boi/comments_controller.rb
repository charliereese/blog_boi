require_dependency "blog_boi/application_controller"

module BlogBoi
  class CommentsController < ApplicationController
  	before_action :set_categories, :is_admin

  	def create
		  @article = Article.find(params[:article_id])
		  @comment = @article.comments.create(comment_params)
		  flash[:notice] = "Comment has been created!"
		  redirect_to articles_path
		end
		 
		private
		  
	  def comment_params
	    params.require(:comment).permit(:text)
	  end

  end
end
