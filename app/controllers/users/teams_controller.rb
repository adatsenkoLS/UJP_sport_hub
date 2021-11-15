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
      
       
  
      if params[:team][:image] != nil
        @team.update(team_name: params[:team][:team_name], city_id: params[:team][:city_id],subcategory_id: params[:team][:subcategory_id],image:  params[:team][:image])
      elsif @team.image.attached?
        @team.update(team_name: params[:team][:team_name], city_id: params[:team][:city_id],subcategory_id: params[:team][:subcategory_id])
      end
     
      
    
      
      redirect_to users_teams_path 
    end


    #Search team autocomplete

  
    def destroy
      @team = Team.find(params[:id])
      @team.destroy()
      redirect_to users_teams_path, warning: "deleted"
    end


    private 
    def team_params
      params.require(:team).permit(:id, :team_name,:city_id, :subcategory_id,:image,:category_id,:q)
    end
  end
end
