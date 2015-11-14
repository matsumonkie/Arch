require "rails_helper"

RSpec.describe PartnerOp do

  let(:partner) { build(:partner) }
  let(:user_with_partner)    { create(:transferee, partner: partner) }
  let(:user_without_partner) { create(:transferee) }

  it 'create' do
    params = {
      user_id: user_without_partner.id,
      partner: {
        firstname: "some value",
        lastname: "some value",
        email: "some value",
        phone: "some value",
        nationality: "some value",
        birthdate: "some value",
      }
    }

    expect(user_without_partner.partner).to eq(nil)
    form = described_class.create(params)
    expect(form.valid?).to be true
    expect(Transferee.find(user_without_partner).partner).not_to eq(nil)
  end

  it 'update' do
    params = {
      user_id: user_with_partner.id,
      partner: {
        firstname: "some value",
        lastname: "some value",
        email: "some value",
        phone: "some value",
        nationality: "some value",
        birthdate: "some value",
      }
    }
    expect(user_with_partner.partner.firstname).to eq(partner.firstname)
    form = described_class.update(params)
    expect(form.valid?).to be true
    expect(Transferee.find(user_with_partner.id).partner.firstname).to eq("some value")
  end

  it 'delete' do
    params = {
      user_id: user_with_partner.id,
      id: partner.id
    }
    expect(user_with_partner.partner).not_to be nil
    form = described_class.delete(params)
    expect(form.valid?).to be true
    expect(Transferee.find(user_with_partner.id).partner).to be nil
  end
end
