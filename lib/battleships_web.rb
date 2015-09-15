require 'sinatra/base'
require_relative '../game_setup.rb'


class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views')}


  get '/' do
    erb :index
  end

  get '/newpage' do
    @visitor = params[:name]
    @board_render = Board.new(Cell).print_html
    erb :newpage
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
