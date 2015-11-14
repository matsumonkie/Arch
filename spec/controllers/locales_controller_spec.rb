require "rails_helper"

RSpec.describe LocalesController do

  it 'GET french' do
    get :french
    expect(response).to be_redirect
  end

  it 'GET english' do
    get :english
    expect(response).to be_redirect
  end
end
