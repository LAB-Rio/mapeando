require 'rails_helper'


describe Pin do

  
  context "Validations & Associations" do
    it { should belong_to :demand }
    it { should delegate_method(:category).to(:demand) }
    it { should delegate_method(:user).to(:demand) }
  end

end
