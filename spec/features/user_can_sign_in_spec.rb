require 'rails_helper'

RSpec.feature "Sign In", type: :feature do
  scenario "User sign in" do
    visit "/sign-up"
    fill_in "user[first_name]", with: "Bilbo"
    fill_in "user[last_name]", with: "Baggins"
    fill_in "user[email]", with: "bilbo@theshire.com"
    fill_in "user[password]", with: "smeagol"
    fill_in "user[password_confirmation]", with: "smeagol"
    click_button "Sign Up"
    visit "/sign-in"
    fill_in "email", with: "bilbo@theshire.com"
    fill_in "password", with: "smeagol"
    click_button "Log In"
    expect(page).to have_content("Well done. You logged in. U smart. P.S. we now have your data.")
  end
end
