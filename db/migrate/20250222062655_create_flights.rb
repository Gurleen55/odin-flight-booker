class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :departure
      t.string :arrival
      t.integer :duration
      t.datetime :time

      t.timestamps
    end
  end
end
