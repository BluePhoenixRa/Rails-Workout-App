require 'rails_helper'

RSpec.feature "Listing Users" do
  before do
    @kate = User.create(email: "kate@test.com", password: "password", username: "K4T3")
    @annie = User.create(email: "annie@ann.com", password: "password", username: "annieworkout")
  end

  scenario "List all users" do
    visit "/"

    expect(page).to have_content("The Lounge")
    expect(page).to have_content(@annie.username)
    expect(page).to have_content(@kate.username)
  end
end
