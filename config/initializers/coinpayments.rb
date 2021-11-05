Coinpayments.configure do |config|
  config.merchant_id     = ENV['COINPAYMENT_MERCHANT_ID']
  config.public_api_key  = ENV['COINPAYMENT_PUBLIC_API_KEY']
  config.private_api_key = ENV['COINPAYMENT_PRIVATE_API_KEY']
  config.secret_phrase   = ENV['COINPAYMENT_SECRET_PHRASE']
end
