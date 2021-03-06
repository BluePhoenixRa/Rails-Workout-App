require 'rails_helper'

RSpec.feature "User Sign Up" do
  scenario "Signing up with credentials" do
    visit "/"

    click_link "Sign Up"
    fill_in "Email", with: "kate@test.com"
    fill_in "Username", with: "kate1"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end
end
