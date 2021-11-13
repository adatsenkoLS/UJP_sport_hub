class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string  :team_name,           null: false, defoult: ""
      t.integer :count_users,         null: true, default: 0
      t.belongs_to :city,  foreign_key: {on_delete: :cascade }
      t.belongs_to :subcategory, foreign_key: {on_delete: :cascade }
      t.datetime :remember_created_at
      t.timestamps null: true
    end
  end
end
