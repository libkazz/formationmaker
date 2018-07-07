class PlayersController < ApplicationController
  before_action :set_team, :set_player

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to @player.team, notice: "Player #{@player.name} was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_team
    @team = Team.published.find_by!(key: params[:team_id])
  end

  def set_player
    @player = @team.players.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :title, :photo)
  end
end
