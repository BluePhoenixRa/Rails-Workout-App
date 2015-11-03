require 'rails_helper'

RSpec.feature "Editing Workout" do
  before do
    @kate = User.create(email: "kate@test.com", password: "password")
    login_as(@kate)

    @kate_exercise = @kate.exercises.create(duration: 20, workout: "Free running", workout_date: "2015-11-01")
  end

  scenario "Editing with valid inputs" do
    visit "/"

    click_link "My Workouts"
    link = "a[href='/users/#{@kate.id}/exercises/#{@kate_exercise.id}/edit']"
    find(link).click

    fill_in "Duration", with: 40
    click_button "Update Exercise"

    expect(page).to have_content("Workout has been updated successfully")
    expect(page).to have_content(40)
    expect(page).not_to have_content(20)
  end
end
