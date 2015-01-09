require "rails_helper"

RSpec.describe TranslationsController do

  it 'show json' do
    get :show, { id: "spec" }
    expect(response).to be_success

    body = JSON.parse(response.body)
    expect(body).to eq({ "foo" => 'bar' })
  end

  it 'false' do
    get :show, { id: "whatever" }
    expect(response).to be_success

    body = JSON.parse(response.body)
    expect(body).to eq({})
  end
end
