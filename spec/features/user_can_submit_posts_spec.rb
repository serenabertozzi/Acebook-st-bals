require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Cannot submit posts unless logged in" do
    visit "/"

    expect(page).not_to have_content("Create Post")
  end

  scenario "Logged in users can submit posts and view them" do
    register_and_sign_in
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"

    expect(page).to have_content("Hello, world!")
  end

  scenario "Can add a post with an image" do
    register_and_sign_in
    fill_in "post[message]", with: "Hello, world!"
    attach_file "post[pictures][]", 'public/teamlogo.png'
    click_button "Create Post"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_css('.card-img-top')
  end
  
  scenario "Posts show a time ago message when they are created" do
    register_and_sign_in
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"

    expect(page).to have_content("Posted less than a minute ago.")
  end

  scenario "User cannot post a blank post" do
    register_and_sign_in
    click_button "Create Post"

    expect(page).to have_content("Please enter a valid message.")
  end
end
