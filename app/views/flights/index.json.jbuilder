json.array!(@flights) do |flight|
  json.extract! flight, :id, :origin, :destination, :date_of_journey, :departure_time, :arrival_time, :price
  json.url flight_url(flight, format: :json)
end
