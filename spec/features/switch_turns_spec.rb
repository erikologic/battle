require 'spec_helper'

feature "Switching turns" do

  scenario "Expect to report turn" do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "Now it is Lauren's turn!"
  end
end
