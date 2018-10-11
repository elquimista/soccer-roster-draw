class MatchesController < ApplicationController
  def edit
    @match = Match
      .includes(home_team: [:players], away_team: [:players])
      .find(params[:id])
    @home_players = @match.home_team.players.order(:birthdate)
    @away_players = @match.away_team.players.order(:birthdate)
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      flash[:success] = 'Fixture updated successfully.'
      redirect_to root_path
    else
      @home_players = @match.home_team.players.order(:birthdate)
      @away_players = @match.away_team.players.order(:birthdate)
      render action: :edit
    end
  end

  private

  def match_params
    params.require(:match).permit(:home_team_score, :away_team_score)
  end
end
