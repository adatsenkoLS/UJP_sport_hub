class TeamsDatatable < ApplicationDatatable
   
    private

    def data
        teams.map do |team|
            [].tap do |column|
                column << team.team_name
                column << team.team_country_city
                column << team.date_added
                column << team.team_category
                column << team.subcategory.name

                links = []
                links << link_to('Edit',"/users/teams/#{team.id}", method: :put ,class: "edit-team")
                links << link_to('Destroy',"/users/teams/#{team.id}", method: :delete)
                column << links.join(' ')    
            end

        end
    end

   def count
    Team.count
   end



   def total_entries
        teams.total_count
        #teams.total_entries   
   end

   def teams
        @teams ||= fetch_teams
   end

   def fetch_teams
    
    search = params[:search][:value]
    array = search.split(',')

    country = array[0]
    category = array[1]
    subcategory = array[2]
    team_name = array[3]

    teams = Team.joins(:subcategory).order("#{sort_column} #{sort_direction}")
    teams = teams.page(page).per(per_page)

    if (country == "") & (category != "") & (subcategory != "")

        
        teams = teams.where("subcategory_id = #{subcategory} and category_id = #{category} and team_name LIKE '%#{team_name}'") 
       
    elsif (country != "" )& (country != nil) & (category != "") & (subcategory = "")
        teams = teams.where("city_id = #{country} and category_id = #{category}  and team_name LIKE '%#{team_name}'") 
    elsif (country != "") & (category != "") & (subcategory != "")
        teams = teams 
    else
        teams = teams
    end


   end

   def columns
    %w(team_name )
    
   end



end