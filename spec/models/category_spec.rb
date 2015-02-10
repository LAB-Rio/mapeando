require "rails_helper"


describe Category do

  context "Validations & Associations" do
    it { should have_many :demands }
    it { should have_many :users }

  end

end
