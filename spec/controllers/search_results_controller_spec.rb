require 'rails_helper'

RSpec.describe SearchResultsController, type: :controller do

  describe "POST #searching" do

    let(:valid_params) { { from_location: 'a',
        to_location: 'b', date_of_journey: Time.now.strftime('%d/%m/%Y') } }

    let(:invalid_params) { { from_location: 'a',
        to_location: 'b', date_of_journey: 'date' } }
    
    it "returns http success" do
      post :searching, valid_params
      
      expect(response).to have_http_status(:success)
    end

    it "creates a new search object" do
      post :searching, valid_params

      expect(assigns(:search)).to have_attributes(from_location: 'a',
           to_location: 'b', date_of_journey: Date.strptime(Time.now.strftime('%d/%m/%Y'), '%d/%m/%Y'))
    end

    context "if search params are not valid" do
      
      it "shows errors" do
        subject = post :searching, invalid_params
        
        expect(subject).to render_template('search_errors')
      end
    end
    
    context "if search params are valid" do
      
      let(:subject) { post :searching, valid_params }
      
      it "creates progress thread" do
        subject
        
        expect(assigns(:index)).to be
      end

      it "saves search params to session" do
        subject

        expect(session["#{assigns(:index)}"]).to have_attributes(from_location: 'a',
                                                           to_location: 'b', date_of_journey: Date.strptime(Time.now.strftime('%d/%m/%Y'), '%d/%m/%Y'))
      end
    end
  end

  describe "POST #show" do

    let(:search) { Search.new(from_location: 'A', to_location: 'B', date_of_journey: Date.strptime('01/02/2016', '%d/%m/%Y')) }

    before do
      post :show, { format: :js, search_id: "x" }, { x: search }
    end
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "searches flights based on search params" do
      expect(assigns(:search_result)).to eq(Flight.find_by( destination: 'B',
        origin: 'A', date_of_journey: Date.strptime('01/02/2016', '%d/%m/%Y')))
    end
  end

end
