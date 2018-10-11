class PagesController < ApplicationController
  def home
    @match = Match
      .includes(home_team: [:players], away_team: [:players])
      .order(created_at: :desc)
      .first
    @home_team = @match.home_team
    @away_team = @match.away_team
  end
end
