require 'rails_helper'

RSpec.feature "Users Signing Out" do
  before do
    @kate = User.create!(email: "kate@test.com", password: "password")

    visit "/"
    click_link "Sign In"
    fill_in "Email", with: @kate.email
    fill_in "Password", with: @kate.password
    click_button "Log in"
  end

  scenario "User clicks signout button" do
    visit "/"

    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully")
  end
end
