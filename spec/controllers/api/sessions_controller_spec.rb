require "rails_helper"

RSpec.describe Api::SessionsController do

  let(:user) { create(:hr) }

  it 'create' do
    params = {
      session: {
        email: user.email,
        password: "12345678"
      }
    }
    post :create, params
    expect(response).to be_success
  end

  it 'doesnt create' do
    params = {
      session: {
        email: user.email,
        password: "whatever"
      }
    }
    post :create, params
    expect(response).to_not be_success
  end

  it 'doesnt create' do
    params = {
      session: {
        email: "any email",
        password: "12345678"
      }
    }
    post :create, params
    expect(response).to_not be_success
  end

  it 'destroy' do
    params = {}
    delete :destroy, params
    expect(response).to be_success
  end
end
