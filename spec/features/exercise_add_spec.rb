require 'rails_helper'

RSpec.feature "Add New Workout" do
  before do
    @kate = User.create!(email: "kate@test.com", password: "password")
    login_as(@kate)
  end

  scenario "Allow users to add new workouts" do
    visit "/"

    click_link "My Workouts"
    click_link "Add Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Workout", with: "Running"
    fill_in "Date", with: "2015-10-28"
    click_button "Add Workout"
    expect(page).to have_content("Workout added successfully!")

    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@kate, exercise))
  end
end
