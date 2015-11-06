require 'rails_helper'

RSpec.feature "Following Friends" do
  before do
    @kate = User.create(email: "kate@test.com", password: "password", username: "K4T3")
    @annie = User.create(email: "annie@ann.com", password: "password", username: "annieworkout")

    login_as(@kate)
  end

  scenario "Following a User" do
    visit "/"

    expect(page).to have_content(@annie.username)
    expect(page).to have_content(@kate.username)
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@kate.id}")

    link = "a[href='/friendships?friend_id=#{@annie.id}']"
    find(link).click

    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@annie.id}")
  end
end
