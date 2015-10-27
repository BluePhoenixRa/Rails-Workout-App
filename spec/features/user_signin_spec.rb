require 'rails_helper'

RSpec.feature "Users Signing In" do
  before do
    @kate = User.create(email: "kate@test.com", username: "kate1", password: "password")
  end

  scenario "Sign in with proper credentials" do
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @kate.email
    fill_in "Password", with: @kate.password
    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Hello, #{@kate.username}")
  end
end
