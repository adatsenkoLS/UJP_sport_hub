class TeamsController < ApplicationController
  def index
    @team = Team.all
  end

  def new
    @team = Team.new

    Rails.logger.debug("My object: #{@team}")
  end

  def show
    @team = Team.all
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    Rails.logger.debug("My object: #{@team}")
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
    params.require(:team).permit(:id, :team_name, :email)
  end
end
