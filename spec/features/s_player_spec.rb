require 'spec_helper'

feature 'Single Player' do
  scenario ' start a single player game' do
    visit('/')
    click_button('Single Player')
    expect(page).to have_content('Single Player') 
  end


  scenario ' finish one round' do
    start_single_game
    click_button('Attack')
    click_button('Finish')
    expect(page).to_not have_content('Computer turn')
  end
end