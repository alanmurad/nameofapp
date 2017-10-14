class PaymentsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@user = current_user
	  token = params[:stripeToken]
	  # Create the charge on Stripe's servers - this will charge the user's card
	  
	  begin
	    charge = Stripe::Charge.create(
	      amount: (@product.price*100).to_i,
	      currency: "gbp",
	      source: token,
	      description: params[:stripeEmail]
	    )
	  rescue Stripe::CardError => e
	    # The card has been declined
	  end

	  redirect_to product_path(@product)
	end
end
