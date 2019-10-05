require_dependency "blog_boi/application_controller"

module BlogBoi
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :destroy] 
    before_action :set_article_by_slug, only: [:show]
    before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_categories

    # GET /articles
    def index
      @articles = Article.all
    end

    # GET /articles/1
    def show
    	@meta_tags[:title] = @article[:title]
    end

    # GET /articles/new
    def new
      @article = Article.new
    end

    # GET /articles/1/edit
    def edit
    end

    # POST /articles
    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to article_path(@article.slug), notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /articles/1
    def update
      if @article.update(article_params)
        redirect_to article_path(@article.slug), notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /articles/1
    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    # GET /articles/category/cool_category
    def category_index
    	@articles = Article.with_category_name(params[:category_name])
    	@category_title = params[:category_name].titleize
    	render :index
    end

    private
      def set_article_by_slug
      	@article = Article.find_by(slug: params[:id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def article_params
        params.require(:article).permit(:title, :text, :author_name, :category_names, :slug, :description, :image)
      end
  end
end
