require 'rails_helper'

describe "as a user" do
  scenario "i can delete an idea" do
    category = Category.create(title: "Vacation")
    idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks", category_id: category.id)
    
    visit ideas_path

    expect(page).to have_content("Summer Trip")

    click_on "Delete"

    expect(current_path).to eq(ideas_path)
    expect(page).not_to have_content("Summer Trip")
  end
end