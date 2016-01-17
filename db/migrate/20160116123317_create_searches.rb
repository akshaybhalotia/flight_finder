class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :from_location
      t.string :to_location
      t.date :date_of_journey
      t.boolean :one_way

      t.timestamps null: false
    end
  end
end
