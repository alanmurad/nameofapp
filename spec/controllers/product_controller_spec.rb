require 'rails_helper'

describe ProductsController, type: :controller do	
	before do
		@user = FactoryBot.create(:user)
		@admin = FactoryBot.create(:admin)
		@product1 = FactoryBot.create(:product, name: "Custom", description: "Nice bike", colour: "black", price: "4000")
		@product2 = FactoryBot.create(:product, name: "Mountain", description: "Mountain bike", colour: "red", price: "5000")
		@product3 = FactoryBot.create(:product, name: "Fast", description: "Fast bike", colour: "blue", price: "3000")
	
	describe 'GET #index' do
		context 'when GET request matches a search_term' do
			it 'displays the search request for a product' do
				get :index, params: {q: 'Custom style'}
				expects(assigns(:products)).to match_array([@product1])
				expects(response).to render_template('index')					
			end		
		end
		context 'when a GET request matches no search_term' do
			it 'displays all the products' do
				get :index
				expects(assigns(:products)).to.match_array([@product.all])
			end	
		end	
	end
	describe 'GET #show' do
		let(:product) { create :product }
		before { get "/products/#{product.id}" }	
		it { is_expected.to be_succesful }
	end

	describe 'GET #new' do
		before { get "/products/new" }
		it { is_expected.to_not be_succesful }
	end		

	describe 'GET #edit' do
		let(:product) { create :product }
		before { get "/products/#{product.id}/edit" }
		it { is_expected.to_not be_succesful }
	end

	describe 'POST #create' do
		it 'is a valid product' do
			@product = FactoryBot.build(:product)
			expect(@product).to be_valid
		end
		it 'is an invalid product, name missing' do
			@product = FactoryBot.build(:product, name: "")
     	expect(@product).not_to be_valid
		end	
			
		it "is an invalid product, price is missing" do
     	@product = FactoryBot.build(:product, price: "")
     	expect(@product).not_to be_valid
   	end	
	end

	describe 'PUT #update' do
    before do
      @product = FactoryBot.create(:product)
    end
    it "update product name" do
      @user_admin = FactoryBot.create(:admin)
      sign_in @user_admin
      @update = { name: "Tao", description: @product.description, image_url: @product.image_url, id: @product_id, price: @product.price }
      put :update, id: @product.id, product: @update
      @product.reload
      expect(@product.name).to eq "Tao"
    end
    it "update product name when a user is not admin and not logged in" do
     	@update = { name: "Tao", description: @product.description, image_url: @product.image_url, id: @product_id, price: @product.price }
     	put :update, id: @product.id, product: @update
     	@product.reload
     	expect(@product.name).not_to eq "Tao"
    end
    it "update product name when a user is not admin and logged in" do
     	@update = { name: "Tao", description: @product.description, image_url: @product.image_url, id: @product_id, price: @product.price }
     	put :update, id: @product.id, product: @update
     	@product.reload
     	expect(@product.name).not_to eq "Tao"
    end
  end

 	describe 'DELETE #destroy' do
   	it "delete product" do
     	@product = FactoryBot.create(:product)
     	@user_admin = FactoryBot.create(:admin)
     	sign_in @user_admin
     	delete :destroy, id: @product.id
     	expect(response).to redirect_to products_path
   	end
 	end
 end
end	