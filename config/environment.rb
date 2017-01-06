# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.default :content_type => "text/html"

# SMTP settings for gmail
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 :address              => "smtp.gmail.com",
 :port                 => 587,
 :user_name            => ENV['GOOGLE_USER'],
 :password             => ENV['GOOGLE_PASSWORD'],
 :authentication       => "plain",
:enable_starttls_auto => true
}
