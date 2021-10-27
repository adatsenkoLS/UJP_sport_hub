class AddCityToArticle < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :city, null: false, foreign_key: true
  end
end
