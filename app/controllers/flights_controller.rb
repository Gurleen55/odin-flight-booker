class FlightsController < ApplicationController
  def index
    @available_airports = Airport.all.pluck(:name, :id)
  end
end
