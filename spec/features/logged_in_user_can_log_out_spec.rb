require 'rails_helper'


RSpec.feature "Log Out", type: :feature do
  scenario "User can log out after logging in" do
    register_and_sign_in
    click_button "Log Out"

    expect(page).to have_content("You have been successfully logged out")
  end
end