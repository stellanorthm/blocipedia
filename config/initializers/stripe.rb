# Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: 'pk_test_0toMoQvGpXgflNgR5RwQULxG',
   secret_key: 'sk_test_tYP3oghQlJ7HNbZy6tcrU5y6'
 }

 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]
