# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.routes.default_url_options[:host]= ENV['HOST URL']
  
ActionMailer::Base.smtp_settings = {
  :authentication => :plain,
  :address        => ENV['MAIL_PROVIDER_ADDRESS'],
  :password       => ENV['MAIL_PROVIDER_PASSWORD'],
  :user_name       => ENV['MAIL_PROVIDER_LOGIN'],
  :port           => ENV['MAIL_PROVIDER_PORT'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
