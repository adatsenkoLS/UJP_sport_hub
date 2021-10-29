class Team < ApplicationRecord
    has_many :user_team
    has_many :user, through: :user_team
    belongs_to :subcategory
    belongs_to :city


    def team_country_city
        return self.city.team_country 
    end

    def date_added
        return self.created_at.to_s.split(' ')[0].gsub('-','/')
    end

    def team_category
        return self.subcategory.category.name
    end
    

end
