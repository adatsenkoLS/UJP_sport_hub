class UserTeamsController < ApplicationController

    def create_team_and_user
  
        @team = Team.find(params['team_id'])
  
        team_and_users = UserTeams.new(user_id: current_user.id,team_id: @team.id)  
        
        if(team_and_user.valid?)
            team_and_users.save
        end

      end
  
      def show
        
      end
  
      private
      def team_and_users_params
        params.require(:team_and_user).permit(:user_id,:team_id)
      end

end
