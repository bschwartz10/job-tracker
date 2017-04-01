require 'rails_helper'

describe "A user can edit a category from the index page" do
  scenario "user edits category" do

    category = Category.create(title: "Web Development")

    # visit edit_category_path
    visit categories_path
    click_link "Edit"
    fill_in "category[title]", with: "Turing Student"
    click_button "Update"

    expect(current_path).to eq category_path(category)
    expect(page).to have_content "Turing Student"
    expect(page).to_not have_content "Web Development"
  end
end
