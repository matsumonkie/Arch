require "rails_helper"

RSpec.describe Api::StakeholdersController do

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
end
