Rails.configuration.stripe = {
  # publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  # secret_key:      ENV['STRIPE_SECRET_KEY']
  publishable_key: 'pk_test_97ZlNg7LtYk9ICp17I6hjlRI',
  secret_key:      'sk_test_5UEW8vga7xU1AtrTgpEnN6XF'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]