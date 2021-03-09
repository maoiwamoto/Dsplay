class ApplicationMailer < ActionMailer::Base
  
  if Rails.env.development? || Rails.env.test? 
  default from: ENV["GMAIL_ADDRESS"]
  layout 'mailer'
  else
  default from: ENV["MAILGUN_SMTP_LOGIN"]
  layout 'mailer'
  end

end
