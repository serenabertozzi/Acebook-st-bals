require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "User will see sign up form if no logged in user and no posts" do
    visit "/"

    expect(page).to have_content("Get Started on Acebook")
    expect(page).to have_button("Sign Up")
    expect(page).to have_field('user[first_name]')
    expect(page).to have_field('user[last_name]')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    expect(page).to have_field('user[password_confirmation]')
  end
end