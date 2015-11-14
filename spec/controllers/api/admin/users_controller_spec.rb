require "rails_helper"

RSpec.describe Api::Admin::UsersController do

  describe 'GET #index' do

    let(:user) { create(:hr) }
    let(:admin) { create(:admin) }
    let(:province) { create(:province) }

    it 'index' do
      login_as admin
      get :index
      expect(response).to be_success
    end

    it 'create' do
      login_as admin
      params = {
        user: {
          email: "foo@foo.foo",
          province_id: province.id,
        }
      }
      post :create, params
      expect(response).to be_success
    end
  end
end
