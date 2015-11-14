require "rails_helper"

RSpec.describe CurrencyOp do

  let!(:currency) { create(:eur_currency) }

  it 'index' do
    res = described_class.index({})
    expect(res.size).to eq 1
  end
end
