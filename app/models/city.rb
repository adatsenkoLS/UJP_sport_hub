class City < ApplicationRecord
    belongs_to :country
    has_many :team


    def team_country
        team_country = "#{self.country.coutry_name}, #{self.city_name}" 
        return team_country 
    end


    def populate_other_list
        country_id = params[:country_id]
        @city = City.find_by country_id: country_id
        respond_to do |format|
          format.json { render json: @city }
        end
      end



end
