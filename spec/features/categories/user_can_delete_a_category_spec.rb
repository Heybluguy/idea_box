require 'rails_helper'

describe 'as a user' do
  describe 'that is an admin' do
    scenario 'i can delete a category' do
      user = User.create(username: "heybluguy", password: "test", role: 1)
      category = Category.create(title: "Vacation")
      visit "/"

      click_on "I already have an account"

      expect(current_path).to eq(login_path)
      fill_in "username",	with: user.username
      fill_in "password",	with: user.password

      click_on "Log In"

      visit admin_categories_path

      expect(page).to have_content("Vacation")

      click_on "Delete"

      expect(current_path).to eq(admin_categories_path)
      expect(page).not_to have_content("Vacation")
    end
  end

  describe 'that is NOT an admin' do
    scenario 'i can not delete a category' do
      user = User.create(username: "heyblugirl", password: "test", role: 0)
      category = Category.create(title: "Vacation")

      visit categories_path

      expect(page).not_to have_link("Delete")
      expect(current_path).to eq(categories_path)
      expect(page).to have_content("Vacation")
    end
  end
end