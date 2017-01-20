require 'spec_helper'

feature "Players attacking" do

  scenario "Expect players to attack and confirm" do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Hit points Player 2: 90'
  end
end
