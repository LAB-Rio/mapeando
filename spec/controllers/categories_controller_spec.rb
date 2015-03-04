require 'rails_helper'

describe CategoriesController do 

  

  describe "GET index" do
    
    it "should return json response with all categories" do
      create_list(:category, 10)
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to include('categories')
    end

  end




end
