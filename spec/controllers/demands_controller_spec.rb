require 'rails_helper'


describe DemandsController do

  context "GET #index" do

    it "should respond with json" do
      demand = create(:demand_with_pins) 
      get :index, { format: :json }

      expect(JSON.parse(response.body)).to eq(JSON.parse({
       demands: [
          id: demand.id,
          fullname: demand.fullname,
          user_id: demand.user_id,
          category_id: demand.category_id,
          category: { name: demand.category.name, travel_mode: demand.category.travel_mode, icon_url: demand.category.icon_url},
          pins: demand.pins.map {|p|{ lat: p.lat, long: p.long, fullname: p.fullname }},
          user: { first_name: demand.user.first_name , last_name: demand.user.last_name, avatar: demand.user.avatar, district: demand.user.district.name }
       ]
      }.to_json))
    end
  end

end
