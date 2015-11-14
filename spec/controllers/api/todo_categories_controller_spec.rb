require "rails_helper"

RSpec.describe Api::TodoCategoriesController do

  let(:user) { create(:transferee) }
  let(:category) { create(:todo_category) }

  it 'index' do
    login_as(user)
    get :index
    expect(response).to be_success
  end
end
