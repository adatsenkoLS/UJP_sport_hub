class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :conference
      t.string :team
      t.string :location
      t.text :alternative_text
      t.string :headline
      t.string :caption
      t.text :content
      t.boolean :show_comments

      t.timestamps
    end
  end
end
