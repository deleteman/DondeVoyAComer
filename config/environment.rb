# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Dondecomo::Application.initialize!

ENV['RAILS_ENV'] = 'production'

#ActionMailer::Base.delivery_method = :smtp

#ActionMailer::Base.server_settings = {
   #:address => "smtp.tutorialspoint.com",
   #:port => 25,
   #:domain => "tutorialspoint.com",
   #:authentication => :login,
   #:user_name => "username",
   #:password => "password",
#}
