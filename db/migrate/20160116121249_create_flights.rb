class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.date :date_of_journey
      t.datetime :departure_time
      t.datetime :arrival_time
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
