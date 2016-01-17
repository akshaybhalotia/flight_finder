require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /search" do
    it "works!" do
      get search_path
      expect(response).to have_http_status(200)
    end
  end
end
