require 'rails_helper'

RSpec.feature "Deleting Workout" do
  before do
    @kate = User.create(email: "kate@test.com", password: "password")
    login_as(@kate)

    @kate_exercise = @kate.exercises.create(duration: 20, workout: "Run, run, run", workout_date: "2015-11-01")
  end

  scenario "Users clicks delete button" do
    visit "/"

    click_link "My Workouts"
    link = "//a[contains(@href, '/users/#{@kate.id}/exercises/#{@kate_exercise.id}') and .//text()='Delete']"

    expect(page).to have_content("Workout has been deleted successfully")
  end
end
