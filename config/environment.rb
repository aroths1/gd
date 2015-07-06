# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
GroupsyDaisy::Application.initialize!

GroupsyDaisy::Application.configure do
  config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    authentication: :plain,
    user_name: 'thirdtriplet',
    password: 'ttrwhc!369',
    enable_starttls: true
  }
end