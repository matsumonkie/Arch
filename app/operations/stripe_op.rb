class StripeOp < Operation

  def charge(params)
    If(User.find(params[:user_id])) do |user|
      if user.stripe_id
        create_charge(user, params[:price])
      else
        Return(InvalidForm.new(credit_card: ["No credit card registered"]))
      end
    end
  end

  # save a credit card infos
  def create(params)
    If(Hr.find(params[:user_id])) do |hr|
      customer = Stripe::Customer.create(source: params[:stripe][:token])
      hr.update_attribute(:stripe_id, customer.id)
      hr.update_attribute(:last_four_digits, customer.sources.data.first.last4)
    end
  end

  def delete(params)
    If(Hr.find(params[:user_id])) do |hr|
      hr.update_attributes(stripe_id: nil, last_four_digits: nil)
    end
  end

  protected

  def create_charge(user, price)
    Stripe::Charge.create(
      # stripe price is always in cents
      amount: price * 100,
      currency: "cad",
      customer: user.stripe_id,
      receipt_email: user.email,
    )
  rescue Stripe::InvalidRequestError => e
    Return(InvalidForm.new(credit_card: e))
  end
end
