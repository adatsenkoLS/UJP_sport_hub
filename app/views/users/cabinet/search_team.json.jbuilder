json.team_to_search do 
    json.array!(@team_to_search) do |team|
        json.name team.team_name
        json.url team.subcategory.name + " " + team.team_country_city
        json.id_team  team.id.to_s
        if team.image.attached?
            json.image url_for(team.image)
        elsif
            json.image 0
        end
    end
end


