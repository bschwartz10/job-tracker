require 'rails_helper'

describe Comment do
  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(content: "Had interview on Friday.")
      expect(comment).to respond_to(:job)
    end
  end
end
