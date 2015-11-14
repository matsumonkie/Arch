require "rails_helper"

RSpec.describe Api::DocumentsController do

  describe 'GET #index' do

    let(:transferee) { create(:transferee, documents: [document]) }
    let(:document) { build(:document, default: false) }
    let(:category) { create(:document_category) }

    it 'get' do
      login_as(transferee)
      params = { user_id: transferee.id }
      get :index, params
      expect(response).to be_success
    end

    it 'create' do
      login_as(transferee)
      params = {
        user_id: transferee.id,
        document: {
          name: "test",
          category_id: category.id,
          collected: true,
          hided: true,
          scanned: true,
          due_date: Date.today,
        }
      }
      post :create, params
      expect(response).to be_success
    end

    it 'update' do
      login_as(transferee)
      params = {
        user_id: transferee.id,
        id: document.id,
        document: {
          name: "test",
          collected: true,
          hided: false,
          scanned: true,
          due_date: Time.now,
        }
      }
      put :update, params
      expect(response).to be_success
    end

    it 'delete' do
      login_as(transferee)
      params = {
        user_id: transferee.id,
        id: document.id,
      }
      delete :destroy, params
      expect(response).to be_success
    end
  end
end
