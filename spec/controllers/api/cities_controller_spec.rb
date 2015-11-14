require "rails_helper"

RSpec.describe Api::CitiesController do

  it 'index' do
    get :index
    expect(response).to be_success
  end
end
