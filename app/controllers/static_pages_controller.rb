class StaticPagesController < ApplicationController
  def index
  end
  def landing_page
    @featured_products = Product.first
    @products = Product.limit(3)
  end
  def thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
	  ActionMailer::Base.mail(:from => @email,
      :to => 'alan.murad42@gmail.com',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
  end
end
