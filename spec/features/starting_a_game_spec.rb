require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end
end

feature 'contains link for new board' do
  scenario 'submits given name' do
    visit '/newpage'
    fill_in('name', :with => 'Nat')
    click_button('Submit')
    expect(page).to have_content "Here is your game board Nat!"
  end

  scenario 'should contain a link for the game board' do
    visit '/newpage'
    fill_in('name', :with => 'Nat')
    click_button('Submit')
    expect(page).to have_link('Game Board', :href => :'/game')
  end
end
