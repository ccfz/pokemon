def sign_in_and_play
	visit('/')
  click_button('Multiplayer')
  fill_in :player1, with: "Terry"
  fill_in :player2, with: "Ruff"
  click_button "Let's PLAY!"
 
end

def one_round
	click_button "Attack"
	click_button "Finished"
end

def start_single_game
  visit('/')
  click_button('Single Player')
  fill_in :player1, with: "Terry"
  click_button "Let's PLAY!"
end

def first_round_single
  start_single_game
  click_button('Attack')
end