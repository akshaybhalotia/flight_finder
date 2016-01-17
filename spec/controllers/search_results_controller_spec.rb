require 'rails_helper'

RSpec.describe SearchResultsController, type: :controller do

  describe "POST #searching" do
    it "returns http success" do
      post :searching, from_location: 'a',
           to_location: 'b', date_of_journey: Time.now.strftime('%d/%m/%Y')
      
      expect(response).to have_http_status(:success)
    end

    it "creates a new search object" do
      post :searching, from_location: 'a',
           to_location: 'b', date_of_journey: Time.now.strftime('%d/%m/%Y')

      expect(assigns(:search)).to have_attributes(from_location: 'a',
           to_location: 'b', date_of_journey: Date.strptime(Time.now.strftime('%d/%m/%Y'), '%d/%m/%Y'))
    end

    it "shows errors if search params are not valid" do
      subject = post :searching, from_location: 'a',
                     to_location: 'b', date_of_journey: 'date'
      
      expect(subject).to render_template('search_errors')
    end
    
    describe "if search params are valid" do
      
      let(:subject) { post :searching, from_location: 'a',
                           to_location: 'b', date_of_journey: Time.now.strftime('%d/%m/%Y') }
      
      it "creates progress status" do
        subject
        
        expect(assigns(:progress_status)).to have_attributes(percent: 0)
      end

      it "saves search params to session" do
        subject

        expect(session[:search_params]).to have_attributes(from_location: 'a',
                                                           to_location: 'b', date_of_journey: Date.strptime(Time.now.strftime('%d/%m/%Y'), '%d/%m/%Y'))
      end

      it "saves progress status id to session" do
        subject
        progress = assigns(:progress_status)
        
        expect(session[:progress_id]).to eq(progress.id)
      end

      it "pushes progress to queue" do
        expect_any_instance_of(Queue).to receive(:push).once
        
        subject
      end
    end
  end

  describe "POST #show" do
    
    it "returns http success" do
      search = Search.new
      search.from_location = 'A'
      search.to_location = 'B'
      search.date_of_journey = Date.strptime('01/02/2016', '%d/%m/%Y')
      request.session[:search_params] = search
      
      post :show, format: :js
      
      expect(response).to have_http_status(:success)
    end

    it "searches flights based on search params" do
      search = Search.new
      search.from_location = 'B'
      search.to_location = 'A'
      search.date_of_journey = Date.strptime('01/02/2016', '%d/%m/%Y')
      request.session[:search_params] = search
      
      post :show, format: :js
      
      expect(assigns(:search_result)).to eq(Flight.find_by( destination: 'A', origin: 'B', date_of_journey: Date.strptime('01/02/2016', '%d/%m/%Y')))
    end
  end

end
