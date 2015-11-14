require "rails_helper"

RSpec.describe BudgetOp do

  let(:user) { create(:transferee) }

  it 'update' do
    params = {
      user_id: user.id,
      budget: {
        shared_budget: 13
      }
    }

    updated_user = described_class.update(params)
    expect(updated_user.valid?).to be true
    budget = User.find(user).shared_budget
    expect(budget).to eq 13
  end
end
