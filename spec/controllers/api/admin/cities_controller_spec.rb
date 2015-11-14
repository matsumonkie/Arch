require "rails_helper"

RSpec.describe Api::Admin::CitiesController do

  describe 'GET #index' do

    let(:city) { create(:city) }
    let(:admin) { create(:admin) }

    it 'index' do
      login_as admin
      get :index
      expect(response).to be_success
    end

    it 'create' do
      login_as admin
      params = {
        city: {
          name_translations: {
            en: "Montreal",
            fr: "Montréal",
          }
        }
      }

      post :create, params
      expect(response).to be_success
    end

    it 'update' do
      login_as admin
      params = {
        id: city.id,
        city: {
          name_translations: {
            en: "new translation",
            fr: "nouvelle traduction",
          }
        }
      }

      put :update, params
      expect(response).to be_success
    end

    it 'delete' do
      login_as admin
      params = {
        id: city.id,
        city: {
          name_translations: {
            en: "new translation",
            fr: "nouvelle traduction",
          }
        }
      }

      delete :destroy, params
      expect(response).to be_success
    end
  end
end
