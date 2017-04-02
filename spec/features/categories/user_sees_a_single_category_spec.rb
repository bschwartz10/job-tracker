require 'rails_helper'

describe "User sees a single category" do
  scenario "with all its attached jobs" do

    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Web Development")
    job1 = category.jobs.create!(title: "Developer", description: "sample description", level_of_interest: 70, city: "Denver", company_id: company)
    job2 = category.jobs.create!(title: "Manager", description: "manager description", level_of_interest: 50, city: "Denver", company_id: company)

    visit category_path(category)


    expect(page).to have_content category.title
    expect(page).to have_content job1.title
    expect(page).to have_content job2.title
  end
end
