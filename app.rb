require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/game_starting' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    # @last_action = session[:last_action] ? session[:last_action] : nil
    erb :play
  end


  post '/attacks' do
    $game.player_attack
    $game.change_turn
    session[:turn] = "#{$game.not_active_player.name} has attacked!<br>Now it is #{$game.active_player.name}'s turn!"
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
