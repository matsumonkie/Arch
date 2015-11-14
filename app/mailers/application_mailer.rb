class ApplicationMailer < ActionMailer::Base
  default from: "foo@bar"
  layout 'mailer'
end
