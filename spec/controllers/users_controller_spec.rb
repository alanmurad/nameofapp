require 'rails_helper'

describe UsersController, type: :controller do
	before  do
		@user1 = FactoryBot.create(:user)		
		@user2 = FactoryBot.create(:user)
  end

	describe 'GET #show' do 
		context 'User is logged in' do 
			before do
        sign_in @user1
      end
 			it 'loads User 1 details' do
   			get :show, params: { id: @user1.id } 
     		expect(assigns(:user)).to eq @user1
     		expect(response).to have_http_status(200)
  		end
  		it 'Doesnt allow access user 2 details' do
    		get :show, params: { id: @user2.id }
      	expect(response).to have_http_status(302)
      	expect(assigns(:user)).to eq @user2
  		end
    	it "should not validate users without an email address" do
      	@user1 = FactoryBot.build(:user, email: "")
      	expect(@user1).to_not be_valid
    	end
			#context 'when a user is not logged in' do
			#it 'redirects to login' do
    	#  get :show, params: { id: @user.id }
    	#    expect(response).to redirect_to(new_user_session_path)
    	#  end
  	end
	end	
end