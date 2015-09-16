require 'sinatra/base'
require_relative '../game_setup.rb'


class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views')}


  get '/' do
    erb :index
  end

  get '/newpage' do
    @visitor = params[:name]
    @board = Board.new(Cell)
    @board_render = @board.show

    erb :newpage
  end

  get '/birds' do
    @bird_array = Bird.new.generate_bird_array
    erb :birds_list
  end

  get '/testing' do
    @array = ["Nat","Aaron","asdasdasd"]
    erb :testing
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
