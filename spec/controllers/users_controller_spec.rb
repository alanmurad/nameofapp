require 'rails_helper'

describe UsersController, type: :controller do
	before  do
		@user = FactoryGirl.create(:user)		
		@user2 = User.create!(email: 'peter@example.com', password: '1234567', first_name: 'John', last_name: 'Smith')
	end

	describe 'GET #show' do 
		context 'when a user is logged in' do 
			before do
        sign_in @user
      end
      it 'loads correct user details' do
      	get :show, params: { id: @user.id }
      	expect(assigns(:user)).to eq @user
      	expect(response).to have_http_status(200)
    	end
    	it 'cant access other users show page' do
        get :show, params: { id: @user2.id }
      	expect { raise "You are not authorized to access this page." }.to raise_error(RuntimeError)
      end
		end
	
		context 'when a user is not logged in' do
			it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
  	end	

	end	
end