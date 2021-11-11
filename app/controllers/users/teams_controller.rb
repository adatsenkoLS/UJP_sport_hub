module Users
  class TeamsController < ApplicationController
    layout 'admin_layout'
    add_flash_types :info, :error, :warning,:success
    def index
      respond_to do |format|
        format.html
        
        format.json { render json: TeamsDatatable.new(view_context) }
      end
    end

    def new
      @team = Team.new
    end

    def show
      @team = Team.find(params[:id])
    end

    def create
      @team = Team.new(team_params)
      if @team.save
        redirect_to  users_teams_path, success: "Invalid"

      else
        pp "Error"
        redirect_to new_users_team_path 
      end
    end


    def create_team_and_user(_response)
      @team_and_users = TeamAndUser.new(@user.id, @team.id)
    end

    def edit
      @team = Team.find(params[:id])
      pp @team
    end

    
    def update
      @team = Team.find(params[:id])
      
      @team.update(team_name: params[:team][:team_name], city_id: params[:team][:city_id],subcategory_id: params[:team][:subcategory_id])
      redirect_to users_teams_path
    end

    def destroy
      @team = Team.find(params[:id])
      @team.destroy()
      redirect_to users_teams_path
    end

    private

    def team_params
      params.require(:team).permit(:id, :team_name,:city_id, :subcategory_id,:image,:category_id)
    end
  end
end
