class DemoRequestMailer < ApplicationMailer

  def new_request(demo_request)
    @demo_request = demo_request
    mail(to: ENV['recipient_email'], subject: 'something')
  end
end
