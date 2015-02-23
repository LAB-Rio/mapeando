require 'rails_helper'


describe DemandsController do




  context "GET #index" do
    before do
      get :index, format: :json
    end


    it "should respond with an array containing all demands if the request is in JSON format" do
      expect(response.body).to eq([{ lat: '11', long: '12' }])
    end

  end

end
