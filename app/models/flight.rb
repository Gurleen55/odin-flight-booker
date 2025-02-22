class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.search(departure_airport_id)
      flights = Flight.all
      flights = flights.where(departure_airport_id: departure_airport_id) if departure_airport_id.present?
  end
end
