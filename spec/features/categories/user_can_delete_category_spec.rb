require 'rails_helper'

describe "User can delete category from index page" do
  scenario "user deletes a category" do
    category = Category.create(title: "Web Development")

    visit categories_path

    click_link "Delete"

    expect(page).to have_content("Web Development was successfully deleted!")
  end
end
