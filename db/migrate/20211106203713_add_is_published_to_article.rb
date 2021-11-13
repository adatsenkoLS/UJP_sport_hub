class AddIsPublishedToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :is_published, :boolean, null: false, default: false
  end
end
