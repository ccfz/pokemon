require 'spec_helper'
require 'capybara'

feature 'Attacking' do

	scenario "notification that player 2 has been hit" do
		sign_in_and_play
		click_button "Attack"
		expect(page).to have_content("Terry has hit Ruff!")
	end

	scenario "player 2's HP reduces" do
		sign_in_and_play
		click_button "Attack"
		expect(page).to_not have_content("Ruff: 20 HP")
	end

	scenario "notification that player 1 has been hit" do
		sign_in_and_play
		one_round
		click_button "Attack"
		expect(page).to have_content("Ruff has hit Terry!")
	end

	scenario "player 1's HP reduces" do
		sign_in_and_play
		one_round
		click_button "Attack"
		expect(page).to_not have_content("Terry: 20 HP")
	end

	scenario "player 2 loses" do
		allow(Kernel).to receive(:rand).and_return(99)
		sign_in_and_play
		click_button('Attack')
		expect(page).to have_content("Ruff IS DEAD!")
	end

end
