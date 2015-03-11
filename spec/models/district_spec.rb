require 'rails_helper'

RSpec.describe District, :type => :model do
  describe "Validations & Associations" do
    it { should have_many :users }
  end
end
