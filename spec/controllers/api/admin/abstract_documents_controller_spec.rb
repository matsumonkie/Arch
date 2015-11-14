require "rails_helper"

RSpec.describe Api::Admin::AbstractDocumentsController do

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
      abstract_document: {
        document_category_id: category.id,
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
      abstract_document: {
        name_translations: {
          en: "foo",
          fr: "bar",
        }
      }
    }
    put :update, params
    expect(response).to be_success
  end
end
