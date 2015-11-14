require "rails_helper"

RSpec.describe AddressOp do

  let(:address) { build(:address) }
  let(:user_with_addresses)    { create(:transferee, addresses: [address]) }
  let(:user_without_addresses) { create(:transferee) }

  it 'create' do
    params = {
      user_id: user_without_addresses.id,
      address: {
        label: "some label",
        civic: "some value",
        city: "some value",
        state: "some value",
        country: "some value",
        postal_code: "some value",
      }
    }

    expect(user_without_addresses.addresses.count).to eq(0)
    form = AddressOp.create(params)
    expect(form.valid?).to be true
    expect(Transferee.find(user_without_addresses).addresses.count).to eq(1)
  end

  it 'update' do
    params = {
      user_id: user_with_addresses.id,
      id: address.id,
      address: {
        label: "some label",
        civic: "some value",
        city: "some value",
        state: "some value",
        country: "some value",
        postal_code: "some value",
      }
    }

    expect(user_with_addresses.addresses.first.civic).to eq(address.civic)
    form = AddressOp.update(params)
    expect(form.valid?).to be true
    expect(form.civic).to eq("some value")
  end

  it 'delete' do
    params = {
      user_id: user_with_addresses.id,
      id: address.id,
    }

    expect(user_with_addresses.addresses.count).to eq(1)
    AddressOp.delete(params)
    addresses = User.find(user_with_addresses).addresses
    expect(addresses.count).to eq(0)
  end
end
