require "rails_helper"

RSpec.describe ProgressStatusesController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:post => "/progress_statuses/show").to route_to("progress_statuses#show")
    end
  end
end
