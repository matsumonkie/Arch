class MailerPreview < ActionMailer::Preview

  def confirm
    user = User.first
    AccountMailer.confirm(user)
  end

  def reset_password
    user = User.first
    AccountMailer.reset_password(user)
  end

  def invoice
    user = Hr.first
    p1 = Purchase.new(package: Package.first, quantity: 1)
    p2 = Purchase.new(package: Package.last, quantity: 2)

    invoice = Invoice.create(hr: Hr.first.id, purchases: [p1, p2])
    AccountMailer.invoice(user.email, invoice)
  end

  def new_request
    demo_request = DemoRequest.new(
      email: 'interested@custom.er',
      firstname: 'firstname',
      lastname: 'lastname',
      job: 'job',
      company: 'company',
      phone: '514-992-2298'
    )
    DemoRequestMailer.new_request(demo_request)
  end
end
