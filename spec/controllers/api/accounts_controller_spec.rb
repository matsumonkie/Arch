require "rails_helper"

RSpec.describe Api::AccountsController do

  let(:transferee) { create(:transferee) }
  let(:closed_transferee) { create(:transferee, closed: true) }
  let(:hr) { create(:hr, transferees: [transferee, closed_transferee]) }

  it 'close' do
    login_as(hr)
    params = {
      user_id: hr.id,
      id: transferee.id
    }
    put :close, params
    expect(response).to be_success
  end

  it 'reopen' do
    login_as(hr)
    params = {
      user_id: hr.id,
      id: closed_transferee.id
    }
    put :reopen, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(hr)
    params = {
      user_id: hr.id,
      id: transferee.id
    }
    delete :destroy, params
    expect(response).to be_success
  end
end
