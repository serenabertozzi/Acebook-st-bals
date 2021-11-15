require 'rails_helper'

RSpec.feature "Sign In", type: :feature do
  scenario "User sign in" do
    only_register
    visit "/sign-in"
    fill_in "email", with: "bilbo@theshire.com"
    fill_in "password", with: "smeagol"
    click_button "Log In"

    expect(page).to have_content("Well done. You logged in. U smart. P.S. we now have your data.")
  end

  scenario "User fails sign in" do
    only_register
    visit "/sign-in"
    fill_in "email", with: "bilbo@theshire.com"
    fill_in "password", with: "smeagoadfadsl"
    click_button "Log In"
    
    expect(page).not_to have_content("Well done. You logged in. U smart. P.S. we now have your data.")
    expect(page).to have_content("U done goofed. Maybe time to reset your password.")
  end
end
