class ChangeFlightsTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :flights, :departure, :string
    remove_column :flights, :arrival, :string

    add_reference :flights, :departure_airport, null: false, foreign_key: { to_table: :airports }
    add_reference :flights, :arrival_airport, null: false, foreign_key: { to_table: :airports }
  end
end
