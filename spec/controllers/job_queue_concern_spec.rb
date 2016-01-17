require 'rails_helper'

RSpec.describe JobQueue do

  before do
    class ExampleController < ApplicationController
      include JobQueue
    end
  end

  after do
    Object.send :remove_const, :ExampleController
  end

  let(:object) { ExampleController.new }

  describe "#find_queue" do

    before do
      object.find_queue
    end
    
    it "defines a queue if not already defined" do
      expect(object.instance_variable_get("@queue")).to be_an_instance_of(Queue)
    end

    it "gets a thread started for new progress pushed in queue" do
      progress = ProgressStatus.create!(percent: 0)
      object.instance_variable_get("@queue").push(progress)
      sleep(3)
      
      expect(progress).to have_attributes(percent: 20)
    end
  end
end
