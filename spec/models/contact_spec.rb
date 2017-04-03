require 'rails_helper'

describe Contact do
  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.create!(full_name: "Brett Schwartz", position: "Web Development Manager", email: "example_email@gmail.com")
      expect(contact).to respond_to(:company)
    end
  end
end
