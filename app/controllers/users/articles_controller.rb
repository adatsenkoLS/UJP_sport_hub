module Users
  class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: %i[edit update destory new create]

    def create
      @post = Post.create(post_params)
      if @post.save
        redirect_to root_path
      else
        flash.now[:error] = 'Could not save an article'
        render action: 'new'
      end
    end

    private

    def post_params
      params.require(:article).permit(:conference, :team, :location, :alternative_text, :headline, :caption,
                                      :show_comments, :user_id)
    end
  end
end
