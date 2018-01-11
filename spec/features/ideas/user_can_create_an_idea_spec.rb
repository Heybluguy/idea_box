require 'rails_helper'

describe 'as a user' do
  describe 'when im in idea box' do
    scenario 'i can create an idea' do
      user = User.create(username: "heyblugirl", password: "test", role: 0)
      category = Category.create(title: 'Vacation')
      title = 'Summer Trip'
      description = 'Swimming whale sharks'
      visit "/"

      click_on "I already have an account"

      expect(current_path).to eq(login_path)
      fill_in "username",	with: user.username
      fill_in "password",	with: user.password

      click_on "Log In"

      visit new_idea_path

      fill_in 'Title', with: title
      fill_in 'Description', with: description
      select('Vacation', :from => 'idea[category_id]')

      click_button 'Create Idea'
      expect(page).to have_content(title)
      expect(page).to have_content(description)
    end
  end
end



# An idea can be created by a user.
