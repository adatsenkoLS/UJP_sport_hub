class UserTeam < ApplicationRecord

    self.primary_keys = :user_id, :team_id

    belongs_to :team
    belongs_to :user
end