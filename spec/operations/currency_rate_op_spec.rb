require "rails_helper"

RSpec.describe CurrencyRateOp do

  let(:rates) { create(:rates) }
  let!(:cad_currency) { create(:cad_currency) }
  let!(:eur_currency) { create(:eur_currency) }
  let!(:usd_currency) { create(:usd_currency) }

  it 'update_rates' do
    allow_any_instance_of(described_class).to receive(:latest_rates_request).and_return(rates)
    described_class.update_rates
    expect(Currency.find_by(code: cad_currency.code).rate).to eq 3.7
    expect(Currency.find_by(code: eur_currency.code).rate).to eq 125.1
    expect(Currency.find_by(code: usd_currency.code).rate).to eq 60.0
  end
end
