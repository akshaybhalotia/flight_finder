require 'rails_helper'

RSpec.describe Flight, type: :model do

  before(:example) do
    @flight = Flight.new
  end

  it "does not contain blank fields" do
    expect(@flight).not_to be_valid
  end

  it "has a valid date of journey" do
    @flight.date_of_journey = "date"
    @flight.valid?

    expect(@flight.errors).to have_key(:date_of_journey)
  end

  it "has a valid departure time" do
    @flight.departure_time = "date time"
    @flight.valid?

    expect(@flight.errors).to have_key(:departure_time)
  end

  it "has a valid arrival time" do
    @flight.arrival_time = "date time"
    @flight.valid?

    expect(@flight.errors).to have_key(:arrival_time)
  end

  it "date of journey should not be before today" do
    @flight.date_of_journey = Date.today.prev_day
    @flight.valid?
    
    expect(@flight.errors).to have_key(:date_of_journey)
  end

  it "departure time should not be before now" do
    @flight.departure_time = Time.now - 1.minute
    @flight.valid?

    expect(@flight.errors).to have_key(:departure_time)
  end

  it "arrival time should not be before departure time" do
    @flight.departure_time = Time.now
    @flight.arrival_time = Time.now - 1.minute
    @flight.valid?

    expect(@flight.errors).to have_key(:arrival_time)
  end

  it "departure time corresponds to date of journey" do
    @flight.date_of_journey = Date.today
    @flight.departure_time = Time.now - 1.day
    @flight.valid?

    expect(@flight.errors).to have_key(:departure_time)
  end

  it "is a valid flight" do
    @flight.origin = "a"
    @flight.destination = "b"
    @flight.price = 100
    @flight.date_of_journey = Date.today
    @flight.departure_time = Time.now + 1.minute
    @flight.arrival_time = Time.now + 1.hour

    expect(@flight).to be_valid
  end
end
