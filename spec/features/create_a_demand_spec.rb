require 'rails_helper'



feature "Creating a new demand" do
  

  scenario "A non logged user try to create a new demand" do
    visit root_path
    click_link "Adicionar Demanda"
    expect(page).to have_content "Você precisa estar logado para criar uma demanda. Clique aqui."


  end


end
