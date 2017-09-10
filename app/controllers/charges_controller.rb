class ChargesController < ApplicationController

  def create
   # Creates a Stripe Customer object, for associating
   # with the charge
   # Amount in cents
   Rails.logger.info "Here:"
   Rails.logger.info params.inspect
   Rails.logger.info params[:stripeToken]

   #stripe = Stripe('pk_test_0toMoQvGpXgflNgR5RwQULxG');
   customer = Stripe::Customer.create(
     email: current_user.email,
     source: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 1500,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   flash[:notice] = "Congratulations on your premium upgrade, #{current_user.email}!"
   current_user.role = 'premium'
   current_user.save!

   redirect_to root_path

   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end

 def new
   @stripe_btn_data = {
     key: "#{Rails.configuration.stripe[:publishable_key]}",
     description: "Premium Membership - #{current_user.email}",
     amount: 1500 #amount in cents
   }
 end


end
