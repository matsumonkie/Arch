require "rails_helper"

RSpec.describe Api::FeedsController do

  let(:transferee) { create(:transferee) }
  let(:hr) { create(:hr, transferees: [transferee]) }

  it 'index' do
    login_as(hr)
    params = {
      user_id: hr.id,
    }
    get :index, params
    expect(response).to be_success
  end

  it 'create' do
    login_as(transferee)
    params = {
      feed: {
        stakeholder_ids: [hr.id],
        action: 'create',
        model: 'expense',
        author_id: transferee.id,
      }
    }
    post :create, params
    expect(response).to be_success
  end
end
