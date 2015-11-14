require "rails_helper"

RSpec.describe Api::UsersController do

  describe 'GET #index' do

    let(:user) { create(:hr) }
    let(:transferee) { create(:transferee) }

    it 'show' do
      login_as(transferee)
      params = {
        id: transferee.id
      }
      get :show, params
      expect(response).to be_success
    end

    it 'current' do
      login_as(user)
      get :current
      expect(response).to be_success

      body = JSON.parse(response.body)
      expect(body.keys).to include('firstname', 'lastname', 'type')
      expect(body['type']).to eq(user.type.to_s)
    end

    it 'current as visitor' do
      get :current
      expect(response).to be_success

      body = JSON.parse(response.body)
      expect(body['type']).to eq('visitor')
    end

    it 'update' do
      login_as(user)
      params = {
        id: user.id,
        user: {
          email: "new_email@email.email"
        }
      }
      put :update, params
      expect(response).to be_success
    end
  end
end
