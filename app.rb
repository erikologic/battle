require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/game_starting' do
    $game = Game.new
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    # @last_action = session[:last_action] ? session[:last_action] : nil
    erb :play
  end


  post '/p1_attacks' do
    $game.attack($player2)
    session[:last_action] = "#{$player1.name} is attacking!"
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
