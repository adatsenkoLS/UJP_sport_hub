module Users
    class CabinetController < ApplicationController
        before_action :authenticate_user!
        include TeamHelper 
        def personal
        end

        def update
            @user = current_user
            @user.first_name = params[:first_name]
            @user.last_name = params[:last_name]
            @user.email = params[:email]
            @user.save
            redirect_back(fallback_location: root_path)
        end

        def password
        end
        
        def change
            @user = current_user
            @user.password = params[:password]
            @user.save
            redirect_back(fallback_location: root_path)
        end

        def surveys
        end

        def unfollow_team
            pp params[:id]
            @team = UserTeam.where(user_id: current_user.id, team_id:  params[:id]).destroy_all

            pp @team
           
            redirect_to   users_followed_team_path
        end

        #Sear
        def followed_team
            @teams = current_user.teams
        end

        def follow_team
            @team = Team.find(params['id-team-search'])
            
            @user_team = UserTeam.new(user_id: current_user.id, team_id:  @team.id) 
            
            if UserTeam.exists?(@user_team.id)
               
                redirect_back(fallback_location: root_path)
            else    
                
                @user_team.save
                redirect_to   users_followed_team_path
                
            end
            
        end


        def all_teams
        
            @teams = current_user.teams 
            
        end


        def search_team
            
            @team_to_search = Team.order(:team_name).where("team_name like ?", "%#{params[:q]}%")
        

            respond_to do |format|
            format.html {
                
            }
            format.json {
                
            }
            end
        end
    
    end
end