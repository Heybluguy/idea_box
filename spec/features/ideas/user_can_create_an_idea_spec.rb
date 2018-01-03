require 'rails_helper'

describe 'as a user' do
  describe 'when im in idea box' do
    scenario 'i can create an idea' do
      visit new_idea_path

      fill_in "Title", with: "Summer Trip"
      fill_in "Description", with: "Swimming whale sharks"
      click_button "Create"
      expect(page).to have_content("Summer Trip")
    end
  end
end



# An idea can be created by a user.
