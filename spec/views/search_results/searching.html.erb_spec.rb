require 'rails_helper'

RSpec.describe "search_results/searching.html.erb", type: :view do

  before do
    @progress_status = ProgressStatus.create(percent: 0)
    
    render
  end
  
  it "contains progress bar" do
    expect(rendered).to have_selector('.progress-bar')
  end

  it "contains bar div with ping-time" do
    expect(rendered).to have_selector('#bar[data-ping-time="1000"]')
  end
end
