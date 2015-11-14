require "rails_helper"

RSpec.describe Api::Admin::TodoCategoriesController do

  let(:user) { create(:admin) }
  let(:category) { create(:todo_category) }

  it 'index' do
    login_as(user)
    get :index
    expect(response).to be_success
  end

  it 'create' do
    login_as(user)
    params = {
      todo_category: {
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
      todo_category: {
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
