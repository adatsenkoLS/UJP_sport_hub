module Users
  class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: %w[index]
    before_action :authenticate_admin!

    def new
      @article = Article.new
    end

    def create
      @article = Article.create(post_params)
      logger.debug "New article #{@article.attributes.inspect}"
      if @article.save
        logger.debug 'The article was saved and user will be redirected...'
        redirect_to @article
      else
        flash.now[:error] = 'Could not save an article'
        render :new
      end
    end


    def show
      @article = Article.find(params[:id])
    end

    private

    def post_params
      params.require(:article).permit(:conference, :team, :location, :alternative_text, :headline, :caption,
                                      :show_comments, :user_id)
    end
  end
end
