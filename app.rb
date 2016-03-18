
require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:game_type)
  end

  post '/player_form' do
    params[:game_type] == 'Single Player' ? erb(:single_form) : erb(:player_form)
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    p player2 = Player.new(params[:player2])
    Game.start(player1, player2)
    redirect('/play')
  end

  before do
    @game = Game.current_game
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
	  Attack.commence(@game.current_opponent)
    if @game.game_over?
      redirect('/game_over')
    else
      @game.computer? ? redirect('/switch_turn') : erb(:attack)
    end
  end

  get '/game_over' do
    erb(:game_over)
  end

  get '/cp_attack' do
    erb(:cp_attack)
  end

	get '/switch_turn' do
    @game.switch_player
    @game.computer? ? redirect('attack') : redirect('/play')
	end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
