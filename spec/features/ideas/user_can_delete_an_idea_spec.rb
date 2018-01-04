require 'rails_helper'

describe "as a user" do
  scenario "i can delete an idea" do
    idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks")
    visit ideas_path
    expect(page).to have_content("Summer Trip")

    click_on "Delete"
    save_and_open_page

    expect(current_path).to eq(ideas_path)
    expect(page).not_to have_content("Summer Trip")
  end
end