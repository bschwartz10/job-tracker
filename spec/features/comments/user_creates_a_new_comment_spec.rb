require 'rails_helper'

describe "User creates a comment" do
  scenario "user fills out form and creates comment" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    comment = Comment.create!(content: "First comment!", job_id: 1)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: comment.content

    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(company,job))
    expect(page).to have_content(comment.content)
  end
end
