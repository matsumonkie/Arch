require "rails_helper"

RSpec.describe Api::ProvincesController do

  let(:province) { create(:province) }
  let(:user) { create(:transferee) }

  it 'index' do
    login_as(user)
    params = {}
    get :index, params
    expect(response).to be_success
  end
end
