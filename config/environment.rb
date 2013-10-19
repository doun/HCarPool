# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Hackathon13Carpool::Application.initialize!


#ENV['SSL_CERT_FILE'] = 'C:/RailsInstaller/cacert.pem'

Rails.env = "production"
