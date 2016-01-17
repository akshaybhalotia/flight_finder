require 'rails_helper'

RSpec.describe "searches/new", type: :view do
  before do
    @search = Search.new
    
    render
  end

  it "has a heading" do
    expect(rendered).to have_content('Search for Flights')
  end

  it "renders new search form" do
    expect(rendered).to have_selector('form')
  end
  
end
