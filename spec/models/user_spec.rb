require 'rails_helper'


describe User do 

  # TODO: do this test
  context "Validations & Associations" do
    user = User.create first_name: '', last_name: '', address_district: 'Zona Norte'

    it "should validate the presence of first name and last name" do
      expect(user.valid?).to be_falsey
      expect(user.errors.size).to eq(2)
    end

    
  end





end
