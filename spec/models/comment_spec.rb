require 'rails_helper'

describe Comment do
  context "Testing Validations missing rating" do
  	it "is not valid without a rating" do
      expect(Comment.new(rating:nil)).not_to be_valid
    end
  end
end