require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end

  get '/play' do
    session[:p1_points] ||= 100
    session[:p2_points] ||= 100
    @p1_points = session[:p1_points]
    @p2_points = session[:p2_points]
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    # @last_action = session[:last_action] ? session[:last_action] : nil
    erb :play
  end


  post '/hit_p2' do
    session[:p2_points] -= 10
    session[:last_action] = "Player 2 was attacked"
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
