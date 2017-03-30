require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do

    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", description: "sample description", level_of_interest: 70, city: "Denver")

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Teacher"
    # save_and_open_page
    click_button "Update Job"

    expect(current_path).to eq(company_job_path(company,job))
    expect(page).to have_content "Teacher"
    expect(page).to_not have_content "Developer"
  end
end
