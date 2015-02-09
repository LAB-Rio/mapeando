require 'rails_helper'


describe Demand do 

  context "Validations & Associations" do
    it { should belong_to :user }
  end

end
