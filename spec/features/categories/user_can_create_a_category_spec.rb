require 'rails_helper'

describe 'as a user' do
  describe 'when im on categories list page' do
    scenario 'i can create a category' do
     visit new_category_path

     fill_in "Title",	with: "Vacations"

     click_button "Create"

     expect(page).to have_content("Vacations")
    end
  end
end