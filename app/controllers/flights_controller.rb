class FlightsController < ApplicationController
  def index
    @available_airports = Airport.all.pluck(:name, :id)
    @available_times = Flight.all.map do |flight|
      [ flight.formatted_time, flight.time  ]
    end
    @flights = Flight.search(flight_params) || []
  end

  private

  def flight_params
    params.permit(:time, :departure_airport_id, :arrival_airport_id, :number_of_passengers)
  end
end
