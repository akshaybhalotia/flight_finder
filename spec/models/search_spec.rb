require 'rails_helper'

RSpec.describe Search, type: :model do

  before(:example) do
    @search = Search.new
  end
  
  it "cannot have blank locations or date" do
    expect(@search).not_to be_valid
  end
  
  it "cannot have invalid date" do
    @search.date_of_journey = "date"
    @search.valid?
    
    expect(@search.errors).to have_key(:date_of_journey)
  end
  
  it "cannot have date of journey before today" do
    @search.date_of_journey = Date.today.prev_day
    @search.valid?
    
    expect(@search.errors).to have_key(:date_of_journey)
  end

  it "is a valid search" do
    @search.from_location = "a"
    @search.to_location = "b"
    @search.date_of_journey = Date.today
    
    expect(@search).to be_valid
  end
end
