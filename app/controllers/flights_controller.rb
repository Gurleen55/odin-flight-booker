class FlightsController < ApplicationController
  def index
    @available_airports = Airport.all.pluck(:name, :id)
    @flights = Flight.search(params[:departure_airport_id]) || []
  end

  private

  def flight_params
    params.expect(:flight [:duration, :time, :departure_airport_id, :arrival_airport_id])
  end
end
