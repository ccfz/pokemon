require 'game'

describe Game do
	let(:tom) { double :player1, :been_hit => nil }
	let(:jerry) { double :player2, :been_hit => nil }
	subject(:game) { described_class.new(tom, jerry) }

	describe '#initialize' do
		it ' a. starts with a player 1' do
			expect(game.player1).to be tom
		end

		it ' b. starts with a player 2' do
			expect(game.player2).to eq jerry
		end

		it ' c. starts with the current_player being player 1' do
			expect(game.current_player).to eq tom
		end
	end

	describe '#computer' do
		it ' should check if it is the computer turn' do
		allow(game.current_player).to receive(:name).and_return('Computer')
		expect(game.computer?).to eq true
		end
	end

	describe '#current_opponent' do
		it ' shows the current_opponent' do
			expect(game.current_opponent).to eq jerry
		end
	end

	describe '#switch_player' do
		it ' changed the current_player' do
			game.switch_player
			expect(game.current_player).to eq jerry
		end
	end

	describe '#game_over?' do
		it ' returns true if a player is dead' do
			allow(tom).to receive(:dead?).and_return(true)
			expect(game.game_over?).to be true
		end
	end
end
