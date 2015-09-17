require 'sinatra/base'
require_relative '../game_setup.rb'


class BattleshipsWeb < Sinatra::Base
  enable :sessions


  get '/' do
    erb :index
  end

  get '/newpage' do
    @visitor = params[:name]
    $board = Board.new(Cell)
    erb :newpage
  end

  get '/game' do
    @destroyer = Ship.destroyer
    coords_1 = params[:coords_1].to_sym if params[:coords_1]
    orient_1 = params[:orient_1].to_sym if params[:orient_1]
      if coords_1 && orient_1
        $board.place(@destroyer, coords_1, orient_1)
      end
    @submarine = Ship.submarine
    coords_2 = params[:coords_2].to_sym if params[:coords_2]
    orient_2 = params[:orient_2].to_sym if params[:orient_2]
      if coords_2 && orient_2
        $board.place(@submarine, coords_2, orient_2)
      end
    @battleship = Ship.battleship
    coords_3 = params[:coords_3].to_sym if params[:coords_3]
    orient_3 = params[:orient_3].to_sym if params[:orient_3]
      if coords_3 && orient_3
        $board.place(@battleship, coords_3, orient_3)
      end
    @fire = params[:fire].to_sym if params[:fire]
      $board.shoot_at(@fire) if @fire
    erb :game
  end

  # TESTING ERB FILE METHODS BELOW

  get '/testing' do
    @array = ["Nat","Aaron","Jesus"]
    @bird_array = Bird.new.generate_bird_array
    erb :testing
  end

  set :views, proc { File.join(root, '..', 'views')}


  # start the server if ruby file executed directly
  run! if app_file == $0
end
