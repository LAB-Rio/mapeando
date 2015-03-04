require 'rails_helper'


describe DemandsController do

  context "GET #index" do

    it "should respond with json" do
      create(:demand_with_pins) 
      get :index, { format: :json }

      expect(JSON.parse(response.body)).to include('demands')
    end
  end

end
