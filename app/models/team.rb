class Team < ApplicationRecord
    has_many :user_team
    has_many :user, through: :user_team
end