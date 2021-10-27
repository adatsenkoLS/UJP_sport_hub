class RemoveColumnsFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :conference, :string
    remove_column :articles, :team, :string
    remove_column :articles, :location, :string
  end
end
