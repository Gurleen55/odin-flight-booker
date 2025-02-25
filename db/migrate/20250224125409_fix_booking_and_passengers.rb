class FixBookingAndPassengers < ActiveRecord::Migration[8.0]
  def change
    remove_column :bookings, :passenger_id, :integer

    # Add correct association in passengers
    add_column :passengers, :booking_id, :integer, null: false
    add_index :passengers, :booking_id
    add_foreign_key :passengers, :bookings
  end
end
