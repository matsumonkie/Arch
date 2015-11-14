require "rails_helper"

RSpec.describe Api::CurrenciesController do

  let(:user)    { create(:transferee) }

  it 'index' do
    login_as(user)

    get :index
    expect(response).to be_success
  end
end
