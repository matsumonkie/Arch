require "rails_helper"

RSpec.describe UserOp do

  let(:user) { create(:regular) }

  it 'index' do
    users = UserOp.index({})
    expect(User.all.size).to eq(0)
  end
end
