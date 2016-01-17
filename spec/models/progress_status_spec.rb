require 'rails_helper'

RSpec.describe ProgressStatus, type: :model do

  before(:example) do
    @progress_status = ProgressStatus.new
  end

  it "does not have blank values" do
    expect(@progress_status).not_to be_valid
  end
  
  it "saves only numeric values as percent" do
    @progress_status.percent = "Done"
    @progress_status.valid?

    expect(@progress_status.errors).to have_key(:percent)
  end

  it "cannot have value less than 0 as percent" do
    @progress_status.percent = "-1"
    @progress_status.valid?

    expect(@progress_status.errors).to have_key(:percent)
  end

  it "cannot have value more than 100 as percent" do
    @progress_status.percent = "101"
    @progress_status.valid?
    
    expect(@progress_status.errors).to have_key(:percent)
  end

  it "is a valid status" do
    @progress_status.percent = "50"

    expect(@progress_status).to be_valid
  end
end
