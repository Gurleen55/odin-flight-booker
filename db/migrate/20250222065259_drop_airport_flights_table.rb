class DropAirportFlightsTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :airport_flights
  end
end
