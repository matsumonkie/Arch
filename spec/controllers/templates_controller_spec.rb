require "rails_helper"

RSpec.describe TemplatesController do

  it 'show' do
    get :show, { id: "spec/index" }
    expect(response).to be_success

    get :show, { id: "spec/index_regular" }
    expect(response).to be_success

    get :show, { id: "spec/index_admin" }
    expect(response).to be_success
  end
end
