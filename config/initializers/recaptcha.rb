# config/initializers/recaptcha.rb

Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPTCHA_PUBLIC']
  config.private_key = ENV['RECAPTCHA_SECRET']
  config.use_ssl_by_default = true
end
