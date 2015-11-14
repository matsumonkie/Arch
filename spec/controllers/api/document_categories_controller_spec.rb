require "rails_helper"

RSpec.describe Api::DocumentCategoriesController do

  let(:user) { create(:transferee) }
  let(:category) { create(:document_category) }

  it 'index' do
    login_as(user)
    get :index
    expect(response).to be_success
  end
end
