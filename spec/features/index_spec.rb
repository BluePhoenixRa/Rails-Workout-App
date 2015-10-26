require 'rails_helper'

RSpec.feature "Index Page" do
  scenario "User visits home page" do
    visit "/"

    expect(page).to have_link('rWorkout')
    expect(page).to have_content('The Lounge')
  end
end
