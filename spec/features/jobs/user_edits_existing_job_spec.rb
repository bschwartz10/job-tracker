require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do

    company = Company.create!(name: "ESPN")
    category1 = Category.create!(title: "Web Development")
    category2 = Category.create!(title: "UX")

    job = company.jobs.create!(title: "Developer", description: "sample description", level_of_interest: 70, city: "Denver", category_id: 1)
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Teacher"
    select "UX", from: "job[category_id]"

    click_button "Update Job"

    expect(current_path).to eq(company_job_path(company,job))
    expect(page).to have_content "Teacher"
    expect(page).to_not have_content "Developer"
    expect(page).to have_content "UX"
  end
end
