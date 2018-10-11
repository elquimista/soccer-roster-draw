class PagesController < ApplicationController
  def home
    @match = Match
      .includes(home_team: [:players], away_team: [:players])
      .order(created_at: :desc)
      .first
    @home_players = @match.home_team.players.order(:birthdate)
    @away_players = @match.away_team.players.order(:birthdate)
  end
end
