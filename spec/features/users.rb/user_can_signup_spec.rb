require 'rails_helper'

describe 'as a user' do
  scenario 'i can signup for an account' do
    visit '/'

    click_on "Sign Up to Be a User"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "heybluguy"
    fill_in "user[password]", with: "test"

    click_on "Create User"

    expect(page).to have_content("Welcome, Heybluguy!")
  end
end