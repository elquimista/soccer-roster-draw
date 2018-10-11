class DrawController < ApplicationController
  def index
    @locations = Location.all
  end
end
