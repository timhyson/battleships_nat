require_relative '../../game_setup.rb'

describe 'shooting at the board' do
  it 'results in :hit if there is a ship' do
    board = Board.new(Cell)
    ship = Ship.destroyer
    board.place(ship, :B2, :vertically)
    expect(board.shoot_at :B2).to eq(true)
  end
end
