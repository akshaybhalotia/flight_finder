require 'rails_helper'

RSpec.describe "SearchResults", type: :request do
  describe "POST /search_results/searching" do
    it "works!" do
      post searching_path, { from_location: "A", to_location: "B", date_of_journey: "01/02/2016" }
      
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /search_results/show" do
    it "works!" do
      post show_path, format: :js
      
      expect(response).to have_http_status(200)
    end
  end
end
