Rails.application.configure do
  config.google_sign_in.client_id     = ENV['dev_client_id']
  config.google_sign_in.client_secret = ENV['dev_client_id']
end