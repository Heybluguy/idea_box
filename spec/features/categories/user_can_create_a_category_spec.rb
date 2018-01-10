require 'rails_helper'

describe 'as a logged-in admin user' do
  scenario 'i can create a category' do
    user = User.create(username: "heybluguy", password: "test", role: 1)

    visit "/"

    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in "username",	with: user.username
    fill_in "password",	with: user.password

    click_on "Log In"
    visit new_admin_category_path

    fill_in "Title",	with: "Vacations"

    click_button "Create"

    expect(page).to have_content("Vacations")
  end
end