class PagesController < ApplicationController
  def home
    @match = Match.order(created_at: :desc).first
  end
end
