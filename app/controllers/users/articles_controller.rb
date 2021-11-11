module Users
  class ArticlesController < ApplicationController
    # layout 'admin_layout'
    # before_action :authenticate_user!, only: %w[index]
    # before_action :authenticate_admin!, only: %w[index new show create]
    include ArticlesHelper
    # skip_before_action :verify_authenticity_token
    # To change status of an article
    def change_status
      @article = Article.find(params[:id])
      p '----------------------------------------------------------------'
      pp @article
      p '----------------------------------------------------------------'
      @article.update(params.require(:article).permit(:is_published))
      redirect_to users_articles_path
    end

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

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
      @article.update(conference_id: params[:article][:conference_id], team_id: params[:article][:team_id],
                      city_id: params[:article][:city_id], alternative_text: params[:article][:alternative_text],
                      headline: params[:article][:headline], caption: params[:article][:caption],
                      user_id: params[:article][:user_id], image: params[:article][:image],
                      content: params[:article][:content])
    end

    private

    def post_params
      @post_params ||= params.require(:article).permit(:conference_id, :team_id, :city_id, :alternative_text,
                                                       :headline, :caption, :user_id, :image, :content)
      @post_params[:user_id] = current_user.id if params[:action] == 'create'
      @post_params
    end
  end
end
