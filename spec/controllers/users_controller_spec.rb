require 'rails_helper'

describe UsersController, type: :controller do
	before do
		@user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
		#@user1 = User.create!(first_name: "Alan", last_name: "Murad", email: "alan@example.com", password: "012345", admin: false)		
		#@user2 = User.create!(first_name: "Peter", last_name: "Walsh", email: "peter@example.com", password: "567890", admin: true)
	end

	describe 'GET #show' do 
		context 'when a user is logged in' do 
			before do
        sign_in @user1
      end
     
      it 'loads correct user details' do
      	get :show, params: { id: @user1.id }
      	expect(response).to have_http_status(200)
    		expect(assigns(:user)).to eq @user1
    	end
    
    	it 'cant access other users show page' do
        get :show, params: { id: @user2.id }
      	expect { raise "You are not authorized to access this page." }.to raise_error(RuntimeError)
      end
		end
	
		context 'when a user is not logged in' do
			it 'redirects to login' do
        get :show, params: { id: @user1.id }
        expect(response).to redirect_to(new_user_session_path)
      end
  	end	

	end	
end