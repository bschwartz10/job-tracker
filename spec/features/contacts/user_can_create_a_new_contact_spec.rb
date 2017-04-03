require 'rails_helper'

describe "User creates a contact" do
  scenario "user fills out form to create a contact" do
    company = Company.create!(name: "ESPN")
    contact = Contact.create!(full_name: "Brett Schwartz", position: "Web Development Manager", email: "example_email@gmail.com", company_id: 1)

    visit company_path(company)

    fill_in "contact[full_name]", with: contact.full_name
    fill_in "contact[position]", with: contact.position
    fill_in "contact[email]", with: contact.email

    click_button "Create Contact"
# save_and_open_page
    expect(current_path).to eq(company_path(company))
    expect(page).to have_content contact.full_name
    expect(page).to have_content contact.position
    expect(page).to have_content contact.email

  end
end
