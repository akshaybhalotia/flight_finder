require "rails_helper"

RSpec.describe SearchResultsController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:post => "/search_results/show").to route_to("search_results#show")
    end

    it "routes to #searching" do
      expect(:post => "/search_results").to route_to("search_results#searching")
    end
  end
end
