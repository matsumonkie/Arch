require "rails_helper"

RSpec.describe ProvinceOp do

  let(:province) { create(:province) }

  it 'index' do
    province
    p = described_class.index({})
    expect(p.size).to eq 1
    expect(p.first.code).to eq 'BC'
  end
end
