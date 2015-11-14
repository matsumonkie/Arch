require "rails_helper"

RSpec.describe Api::MessagesController do

  let(:transferee) { create(:transferee, hr: hr) }
  let(:hr) { create(:hr) }

  it 'index' do
    login_as(transferee)
    params = {
      user_id: transferee.id,
    }

    get :index, params
    expect(response).to be_success
  end

  it 'create' do
    login_as(transferee)
    params = {
      user_id: transferee.id,
      message: {
        content: "coucou",
        author_id: hr.id,
      }
    }

    post :create, params
    expect(response).to be_success
  end
end
