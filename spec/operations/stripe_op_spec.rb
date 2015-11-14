require "rails_helper"

RSpec.describe StripeOp do

  let(:hr_with_credit_card) { create(:hr_with_credit_card) }
  let(:hr) { create(:hr) }
  let(:hr_with_wrong_stripe_id) { create(:hr_with_credit_card, stripe_id: "whatever") }
  let(:package1) { create(:package1) }

  it 'charge' do
    params = {
      user_id: hr_with_credit_card.id,
      price: 100,
    }

    allow_any_instance_of(StripeOp).to receive(:create_charge).and_return({})
    form = described_class.charge(params)
    expect(form.valid?).to be true
  end

  context 'credit card error' do
    it 'hasnt a stripe_id' do
      params = {
        user_id: hr.id,
        package: {
          id: package1,
        }
      }

      expect(described_class.charge(params).valid?).to be false
    end

    it 'has invalid stripe_id' do
      params = {
        user_id: hr_with_wrong_stripe_id.id,
        price: 100,
      }
      allow(Stripe::Charge).to receive(:create) { raise Stripe::InvalidRequestError.new(nil, nil) }
      expect(described_class.charge(params).valid?).to be false
    end
  end
end
