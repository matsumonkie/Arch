require "rails_helper"

RSpec.describe Api::TranslationsController do

  it 'show json' do
    get :index, { id: ["spec"] }
    expect(response).to be_success

    body = JSON.parse(response.body)
    expect(body).to eq({"spec" => { "foo" => 'bar' }})
  end

  it 'false' do
    get :index, { id: ["whatever"] }
    expect(response).to be_success

    body = JSON.parse(response.body)
    expect(body).to eq({})
  end
end
