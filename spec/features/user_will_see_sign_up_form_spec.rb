require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "User will see sign up form if no logged in user and no posts" do
    visit "/"

    expect(page).to have_content("Get Started on Acebook")
    expect(page).to have_xpath('/html/body/form[1]/div[1]/input')
  end
end