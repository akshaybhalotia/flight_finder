require 'rails_helper'

RSpec.describe "flights/_flight.html.erb", type: :view do

  before do
    render partial: 'flights/flight.html.erb', locals: { flight: Flight.all.last() }
  end
  
  it "contains flight info" do
    expect(rendered).to have_content('From')
  end

end
