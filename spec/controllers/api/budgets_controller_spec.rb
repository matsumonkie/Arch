require "rails_helper"

RSpec.describe Api::BudgetsController do

  let(:user) { create(:transferee) }

  it 'update' do
    login_as(user)
    params = {
      user_id: user.id,
      budget: {
        shared_budget: 1,
      }
    }

    put :update, params
    expect(response).to be_success
  end
end
