class CreateNewsPartners < ActiveRecord::Migration[6.1]
  def change
    create_table :news_partners do |t|
      t.string :title
      t.boolean :active
      t.string :api_key
      t.string :default_sources

      t.timestamps
    end
  end
end
