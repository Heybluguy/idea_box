require 'rails_helper'

describe "as a user" do
  scenario "i can delete my idea" do
    user = User.create(username: "heyblugirl", password: "test", role: 0)
    category = Category.create(title: "Vacation")
    idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks", category_id: category.id, user_id: user.id)

    visit "/"

    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in "username",	with: user.username
    fill_in "password",	with: user.password

    click_on "Log In"

    visit ideas_path

    expect(page).to have_content("Summer Trip")

    click_on "Delete"

    expect(current_path).to eq(ideas_path)
    expect(page).not_to have_content("Summer Trip")
  end
end