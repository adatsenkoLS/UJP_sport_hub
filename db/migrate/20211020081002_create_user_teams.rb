class CreateUserTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :user_teams do |t|
      t.belongs_to :user, through: :team_end_user, foreign_key: {on_delete: :cascade }
      t.belongs_to :team, through: :team_end_user, foreign_key: {on_delete: :cascade }
      t.timestamps
    end
  end
end
