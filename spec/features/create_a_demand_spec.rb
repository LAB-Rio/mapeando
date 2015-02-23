require 'rails_helper'



feature "Creating a new demand" do
  

  scenario "A non logged user try to create a new demand" do
    visit root_path
    click_link "new-demand"
    expect(page).to have_content "Você precisa estar logado para criar uma demanda. Clique aqui."
  end


  scenario "A logged user tries to create a new demand" do
    visit root_path
    click_link "new-demand"
    expect(page).to have_content "Onde é sua demanda?"
  end


end
