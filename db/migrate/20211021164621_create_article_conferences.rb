class CreateArticleConferences < ActiveRecord::Migration[6.1]
  def change
    create_table :article_conferences do |t|
      t.timestamps
    end
  end
end
