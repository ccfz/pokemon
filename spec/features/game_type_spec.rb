feature 'Choose game type' do
  scenario 'player can choose single player' do
    visit('/')
    click_button('Single Player')
    expect(page).to have_content('Single Player')
  end

  scenario 'place can choose multiplayer' do
    visit('/')
    click_button('Multiplayer')
    expect(page).to have_content('Multiplayer')
  end
end
