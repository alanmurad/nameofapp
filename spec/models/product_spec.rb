require 'rails_helper'

describe Product do
	context "when the product has comments" do	
		let(:product) { Product.create!(name: "race bike", description: "best bike", colour: "black", price: "199") }
		before(:each) do
			@user = FactoryBot.create(:user)
		end
		before do
	  	@comment1 = product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
	  	@comment2 = product.comments.create!(rating: 3, user: @user, body: "Nice bike!")
	  	@comment3 = product.comments.create!(rating: 5, user: @user, body: "Great bike!")
		end
		it "returns the average rating of all comments" do
			expect(Comment.average(:rating)).to eq(3)
		end
	end
	context "is not valid without input in all requested fields (name, description, price, colour, imagage_url)" do
    let(:product) {Product.new(description: "What a nice bike")}

    it "returns a validation error" do
      expect(Product.new(description: "What a nice bike")).not_to be_valid
    end
  end

  context "is not valid without input in all requested fields (name, description, price, colour, imagage_url)" do
    let(:product) {Product.new(name: "Thunder")}

    it "returns a validation error" do
      expect(Product.new(name: "Thunder")).not_to be_valid
    end
  end

  context "is not valid without input in all requested fields (name, description, price, colour, imagage_url)" do
    let(:product) {Product.new(colour: "white")}

    it "returns a validation error" do
      expect(Product.new(colour: "white")).not_to be_valid
    end
  end

  context "is not valid without input in all requested fields (name, description, price, colour, imagage_url)" do
    let(:product) {Product.new(price: "399")}

    it "returns a validation error" do
      expect(Product.new(price: "399")).not_to be_valid
    end
  end
end