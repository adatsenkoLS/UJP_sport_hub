class AddConferenceToArticleconference < ActiveRecord::Migration[6.1]
  def change
    add_reference :article_conferences, :conference, null: false, foreign_key: true
  end
end
