require "rails_helper"

RSpec.describe Api::Admin::DocumentCategoriesController do

  let(:user) { create(:admin) }
  let(:category) { create(:document_category) }

  it 'index' do
    login_as(user)
    get :index
    expect(response).to be_success
  end

  it 'create' do
    login_as(user)
    params = {
      document_category: {
        name_translations: {
          en: "foo",
          fr: "bar",
        }
      }
    }
    post :create, params
    expect(response).to be_success
  end

  it 'update' do
    login_as(user)
    params = {
      id: category.id,
      document_category: {
        name_translations: {
          en: "foo",
          fr: "bar",
        }
      }
    }
    put :update, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(user)
    params = {
      id: category.id,
    }
    delete :destroy, params
    expect(response).to be_success
  end
end
