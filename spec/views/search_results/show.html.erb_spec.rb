require 'rails_helper'

RSpec.describe "search_results/_show.html.erb", type: :view do

  it "has back button" do
    render 'search_results/show.html.erb'
    
    expect(rendered).to have_selector("input.btn")
  end

  it "shows no results label" do
    render 'search_results/show.html.erb'
    
    expect(rendered).to have_content('No results found')
  end

  it "shows flight details" do
    @search_result = Flight.all
    render 'search_results/show.html.erb'

    expect(rendered).to have_content('From')
  end
end
