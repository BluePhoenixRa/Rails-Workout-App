require 'rails_helper'

RSpec.feature "Searching for Users" do
  before do
    @kate = User.create(email: "kate@test.com", password: "password", username: "K4T3")
    @bob = User.create(email: "bob@bob.com", password: "password", username: "bob")
    @jane = User.create(email: "jane@test.com", password: "password", username: "workoutaholic")
  end

  scenario "Return users who match search criteria" do
    visit "/"

    fill_in "search_username", with: "Bob"
    click_button "Search"

    expect(page).to have_content(@bob.username)
    expect(current_path).to eq("/dashboard/search")
  end
end
