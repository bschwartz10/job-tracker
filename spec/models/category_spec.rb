require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid validations" do
      it "is invalid without a name" do
        category = Category.new()
        expect(category).to be_invalid
      end

      it "has a unique title" do
        Category.create(title: "Web Development")
        category = Category.create(title: "Web Development")
        expect(category).to be_invalid
      end

      context "valid attributes" do
        it "is valid with a title" do
          category = Category.new(title: "Web Development")
          expect(category).to be_valid
        end
        
      end
    end
  end
end
