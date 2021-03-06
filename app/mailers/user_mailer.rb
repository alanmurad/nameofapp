class UserMailer < ApplicationMailer
	default from: 'alan.murad42@gmail.com'
	
	def contact_form(email, name, message)
  	@message = message
    mail(from: email,
      to: 'alan.murad42@gmail.com',
      subject: "A new contact form message from #{name}")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
  
  def payment_received(user, product)
    @user = user
    @product = product
    mail to: user.email, subject: "Thank you for your order."
  end

  def welcome(user)
  	@user = user
    @appname = "Bike Shop"
  	mail(to: user.email,
      subject: "Welcome to #{@appname}!")
	end
end
