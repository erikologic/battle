require 'spec_helper'


feature "Players filling name" do

  scenario "Expect players to fill form" do
    sign_in_and_play
    expect(page).to have_content 'Rob vs. Lauren'
  end
end
