require 'rails_helper'

describe 'as a user' do
  scenario 'i can delete a category' do
    category = Category.create(title: "Vacation")

    visit categories_path

    expect(page).to have_content("Vacation")

    click_on "Delete"

    expect(current_path).to eq(categories_path)
    expect(page).not_to have_content("Vacation")
  end
end