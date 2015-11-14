require "rails_helper"

RSpec.describe Api::AddressesController do

  let(:address) { build(:address) }
  let(:user_with_addresses)    { create(:transferee, addresses: [address]) }
  let(:user_without_addresses) { create(:transferee) }

  it 'create' do
    login_as(user_without_addresses)
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
    post :create, params
    expect(response).to be_success
  end

  it 'update' do
    login_as(user_with_addresses)
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

    put :update, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(user_with_addresses)
    params = {
      user_id: user_with_addresses.id,
      id: address.id,
    }

    delete :destroy, params
    expect(response).to be_success
  end
end
