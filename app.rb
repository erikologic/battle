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
    erb :play
  end


  post '/attacks' do
    begin
      $game.player_attack
    rescue
      redirect '/game_over'
    end
    $game.change_turn
    session[:turn] = "#{$game.not_active_player.name} has attacked!<br>Now it is #{$game.active_player.name}'s turn!"
    redirect '/play'
  end

  get '/game_over' do
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
