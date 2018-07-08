class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@projects.com'
  layout 'mailer'
end
