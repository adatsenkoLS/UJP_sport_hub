module Users
  class TeamsController < ApplicationController
    layout 'admin_layout'
    def index
      @team = Team.all
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
        redirect_to @team
      else
        render :new
      end
    end

    def create_team_and_user(_response)
      @team_and_users = TeamAndUser.new(@user.id, @team.id)
    end

    private

    def team_params
      params.require(:team).permit(:id, :team_name, :city_id,:subcategory_id)
    end

  end
end
