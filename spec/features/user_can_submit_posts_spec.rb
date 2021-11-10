require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    expect(page).to have_content("Hello, world!")
  end
  
  scenario "Posts show when they are created" do
    #implement some timecop stuff later
    visit "/"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    visit "/"
    expect(page).to have_content("ago")
  end
end
