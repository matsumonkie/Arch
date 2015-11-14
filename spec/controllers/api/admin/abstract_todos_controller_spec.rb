require "rails_helper"

RSpec.describe Api::Admin::AbstractTodosController do

  describe 'GET #index' do

    let(:admin) { create(:admin) }
    let(:category) { create(:document_category) }
    let(:document) { create(:abstract_document) }

    it 'index' do
      login_as admin
      get :index
      expect(response).to be_success
    end

    it 'create' do
      login_as admin
      params = {
        id: document.id,
        abstract_todo: {
          todo_category_id: category.id,
          name_translations: {
            en: "new translation",
            fr: "nouvelle traduction",
          }
        }
      }

      post :create, params
      expect(response).to be_success
    end

    it 'update' do
      login_as admin
      params = {
        id: document.id,
        abstract_todo: {
          todo_category_id: category.id,
          name_translations: {
            en: "new translation",
            fr: "nouvelle traduction",
          }
        }
      }

      put :update, params
      expect(response).to be_success
    end
  end
end
