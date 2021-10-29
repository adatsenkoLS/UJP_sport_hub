module Users
  class ArticlesController < ApplicationController
    # layout 'admin_layout'
    # before_action :authenticate_user!, only: %w[index]
    # before_action :authenticate_admin!, only: %w[index new show create]

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def show
      @article = Article.find(params[:id])
    end

    def create
      @article = Article.new(post_params.except('conference_id'))
      logger.debug "New article #{@article.attributes.inspect}"
      if @article.save
        @article_conference = ArticleConference.create!(conference_id: post_params['conference_id'],
                                                        article_id: @article.id)
        logger.debug 'The article was saved and user will be redirected...'

        redirect_to users_articles_path
      else
        pp @article.errors
        flash.now[:error] = 'Could not save an article'
        render :new
      end
    end

    private

    def post_params
      @post_params ||= params.require(:article).permit(:conference_id, :team_id, :city_id, :alternative_text,
                                                       :headline, :caption, :user_id)
      @post_params[:user_id] = current_user.id if params[:action] == 'create'
      @post_params
    end
  end
end
