class CreateUserTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :user_teams, primary_key: [:user_id, :team_id] do |t|
      t.belongs_to :user, through: :team_end_user,null:false, foreign_key: {on_delete: :cascade }
      t.belongs_to :team, through: :team_end_user,null:false, foreign_key: {on_delete: :cascade, }
      t.timestamps
    end
  end
end
