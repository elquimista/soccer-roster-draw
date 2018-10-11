class MatchesController < ApplicationController
  def edit
    @match = Match
      .includes(home_team: [:players], away_team: [:players])
      .find(params[:id])
    @home_team = @match.home_team
    @away_team = @match.away_team
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      redirect_to root_path, notice: 'Fixture updated successfully.'
    else
      @home_team = @match.home_team
      @away_team = @match.away_team
      render action: :edit
    end
  end

  private

  def match_params
    params.require(:match).permit(:home_team_score, :away_team_score)
  end
end
