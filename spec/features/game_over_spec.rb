require 'spec_helper'

feature "Game over" do

  scenario "Expect player 1 to win" do
    sign_in_and_play
    19.times{click_button 'Attack'}
    expect(page).to have_content 'Rob won'
  end
end
