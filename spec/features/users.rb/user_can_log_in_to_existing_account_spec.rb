require 'rails_helper'

describe 'as a user' do
  scenario 'i can log in to my existing account' do
    user = User.create(username: "heybluguy", password: "test")

    visit "/"

    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in "username",	with: user.username
    fill_in "password",	with: user.password

    click_on "Log In"

    expect(page).to have_content("Welcome, #{user.username.capitalize}")
    expect(page).to have_content("Logout")
  end
end