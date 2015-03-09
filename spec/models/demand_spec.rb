require 'rails_helper'


describe Demand do 

  context "Validations & Associations" do
    it { should belong_to :user }
    it { should validate_presence_of :user }
    it { should validate_presence_of :category }

    it { should have_many :pins }
  end

end
