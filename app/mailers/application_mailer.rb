class ApplicationMailer < ActionMailer::Base
  default from: ENV["INFO_EMAIL"]
  layout 'mailer'
end
