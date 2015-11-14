require "rails_helper"

RSpec.describe StakeholderOp do

  let(:hr) { create(:hr, transferees: [ transferee ]) }
  let(:transferee) { create(:transferee) }

  it 'index' do
    params = { user_id: hr.id }
    stakeholders = described_class.index(params)
    expect(stakeholders.size).to eq(1)
    expect(stakeholders.first.id).to eq(transferee.id)

    params = { user_id: transferee.id }
    stakeholders = described_class.index(params)
    expect(stakeholders.size).to eq(1)
    expect(stakeholders.first.id).to eq(hr.id)
  end
end
