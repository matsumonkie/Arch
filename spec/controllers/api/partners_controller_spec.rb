require "rails_helper"

RSpec.describe Api::PartnersController do

  let(:partner) { build(:partner) }
  let(:user_with_partner)    { create(:transferee, partner: partner) }
  let(:user_without_partner) { create(:transferee) }

  it 'create' do
    login_as(user_without_partner)
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
    post :create, params
    expect(response).to be_success
  end

  it 'update' do
    login_as(user_with_partner)
    params = {
      user_id: user_with_partner.id,
      id: partner.id,
      partner: {
        firstname: "some value",
        lastname: "some value",
        email: "some value",
        phone: "some value",
        nationality: "some value",
        birthdate: "some value",
      }
    }

    put :update, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(user_with_partner)
    params = {
      user_id: user_with_partner.id,
      id: partner.id,
    }

    delete :destroy, params
    expect(response).to be_success
  end
end
