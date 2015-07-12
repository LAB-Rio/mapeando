require 'rails_helper'


describe User do 

  context "Validations & Associations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }

    it { should belong_to :district }
    it { should have_many :demands }

    it { should have_and_belong_to_many :likes }

  end





end
