require 'sinatra/base'



class Battle < Sinatra::Base
  get '/check' do
    'Hello Battle!'
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @player1 =params[:name1]
    @player2 =params[:name2]
    erb(:play)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end

