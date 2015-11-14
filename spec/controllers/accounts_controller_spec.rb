require "rails_helper"

RSpec.describe AccountsController do

  let(:transferee) { create(:transferee) }
  let(:unactivated_user) { create(:hr, encrypted_password: "", activated: false) }

  it 'index' do
    params = {
      email: unactivated_user.email,
      confirmation_token: unactivated_user.confirmation_token,
    }

    expect(unactivated_user.activated).to be false
    get :confirm, params
    expect(response.status).to eq(200)
  end

  it 'activate' do
    params = {
      id: unactivated_user.id,
      account: {
        email: unactivated_user.email,
        confirmation_token: unactivated_user.confirmation_token,
        password: "12345678",
        password_repetition: "12345678",
      }
    }

    expect(unactivated_user.encrypted_password).to be_empty
    put :activate, params
    expect(response.status).to eq 302
    expect(User.last.encrypted_password).to_not be_empty
  end

  it 'reset password' do
    params = {
      account: {
        email: transferee.email
      }
    }
    put :reset_password, params
    expect(response).to be_redirect
  end
end
