class DrawController < ApplicationController
  def index
    match = Match.order(created_at: :desc).first
    if match.home_team_score.nil? || match.away_team_score.nil?
      redirect_to edit_match_path(match)
    end
    @locations = Location.all
  end

  def create
    @match = nil
    Match.transaction do
      home_team = Team.create!
      away_team = Team.create!
      populate_rosters!(home_team, away_team)
      @match = Match.create!(
        location_id: params[:location_id],
        date_time: date_time(params[:date_time]),
        home_team: home_team,
        away_team: away_team
      )
    end
    unless @match&.persisted?
      flash[:error] = ':( &nbsp;There was an error while trying to seed a draw.'
      redirect_to action: :index
    end
  end

  private

  def date_time(obj)
    DateTime.civil(obj[:year].to_i, obj[:month].to_i, obj[:day].to_i, obj[:hour].to_i, obj[:minute].to_i)
  end

  def populate_rosters!(home_team, away_team)
    Player.all.shuffle.each.with_index do |player, i|
      home_team.players << player if i.even?
      away_team.players << player if i.odd?
    end
  end
end
