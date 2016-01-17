require 'rails_helper'

RSpec.describe "ProgressStatuses", type: :request do
  describe "POST /progress_statuses/show/:id" do
    it "works!" do
      progress_status = ProgressStatus.create!(
        percent: 0
      )
      post "/progress_statuses/show/#{progress_status.id}"

      expect(response).to have_http_status(200)
    end
  end
end
