class City < ApplicationRecord
    belongs_to :country



    def team_country

        team_country = "#{self.country.coutry_name} #{self.city_name}" 

        return team_country 
    
    end
end
