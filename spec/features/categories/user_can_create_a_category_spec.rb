require 'rails_helper'

describe 'as a user' do
  describe 'that is an admin' do
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

  describe 'that is NOT an admin' do
    scenario 'i can create a category' do
      user = User.create(username: "heyblugirl", password: "test", role: 0)

      visit "/"

      click_on "I already have an account"

      expect(current_path).to eq(login_path)
      fill_in "username",	with: user.username
      fill_in "password",	with: user.password

      click_on "Log In"

      visit new_admin_category_path

      expect(page).to have_content("The page you were looking for doesn't exist.")

    end
  end
end