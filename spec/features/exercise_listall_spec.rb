require 'rails_helper'

RSpec.feature "List all user workouts" do
  before do
    @kate = User.create!(email: "kate@test.com", password: "password", username: "K4T3")
    login_as(@kate)

    @exercise1 = @kate.exercises.create(duration: 20, workout: "Run, run, run!", workout_date: "2015-11-01")
    @exercise2 = @kate.exercises.create(duration: 40, workout: "Swim, run, spin", workout_date: "2015-11-02")
  end

  scenario "List all exercises" do
    visit "/"

    click_link "My Workouts"
    expect(page).to have_content(@exercise1.duration)
    expect(page).to have_content(@exercise1.workout)
    expect(page).to have_content(@exercise1.workout_date)
    expect(page).to have_content(@exercise2.duration)
    expect(page).to have_content(@exercise2.workout)
    expect(page).to have_content(@exercise2.workout_date)
  end

end
