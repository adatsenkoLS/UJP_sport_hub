class AddTeamsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :team, null: false, foreign_key: true
  end
end
