require 'rails_helper'

describe "as a user" do
  scenario "i can edit and update an idea" do
    category = Category.create(title: "Vacation")
    idea = Idea.create(title: "Summer Trip", description: "Swimming with whale sharks", category_id: category.id)

    visit ideas_path

    click_on "Edit"
    fill_in "Title", with: "Winter Trip"
    fill_in "Description", with: "Riding sleighs"
    select("Vacation", :from => "idea[category_id]")

    click_on "Update"

    # expect(page).to have_content("Riding sleighs")
    # expect(current_path).to eq(idea_path(idea))
  end
end




# An idea can be edited/updated
# only by the user that created it