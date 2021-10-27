module Users
  class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: %w[index]
    before_action :authenticate_admin!, only: %w[index new show create]

    def index
      @article = Article.all
    end

    def new
      @article = Article.new
    end

    def show
      @article = Article.find(params[:id])
    end

    def create
      pp post_params.except['conferences_id']
      @article = Article.new(post_params.except[conference_id])

      logger.debug "New article #{@article.attributes.inspect}"
      if @article.save
        @article_conference = ArticleConference.create!(conference_id: post_params['conference_id'],
                                                        article_id: @article.id)
        logger.debug 'The article was saved and user will be redirected...'
        redirect_to @article
      else

        pp @article.errors
        flash.now[:error] = 'Could not save an article'
        render :new
      end
    end

    private

    def post_params
      params.require(:article).permit(:conferences_id, :teams_id, :city_id, :alternative_text, :headline, :caption,
                                      :users_id)
    end
  end
end
