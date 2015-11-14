require "rails_helper"

RSpec.describe PackageOp do

  let(:package1) { create(:package1) }
  let(:package2) { create(:package2) }
  let(:package3) { create(:package3) }
  let(:province) { create(:province) }
  let(:hr) { create(:hr, package: package1, province_id: province_id) }
  let!(:admin) { create(:admin) }
  let(:hr_with_credit_card) { create(:hr_with_credit_card, province_id: province.id) }

  it 'index' do
    # lazy creation
    package1
    package2
    package3
    res = described_class.index({})
    expect(res.size).to eq 3
  end

  it 'purchase' do
    params = {
      user_id: hr_with_credit_card.id,
      package: {
        "#{package1.id}": 1,
        "#{package2.id}": 2,
        "#{package3.id}": 3,
      }
    }

    allow_any_instance_of(StripeOp).to receive(:charge) { :whatever }
    expect(hr_with_credit_card.credits).to eq(0)
    form = described_class.purchase(params)
    expect(form.valid?).to be true
    expect(User.find(hr_with_credit_card.id).credits).to eq(6)
  end

  it 'request invoice' do
    params = {
      user_id: hr_with_credit_card.id,
      package: {
        "#{package1.id}": 1,
        "#{package2.id}": 2,
        "#{package3.id}": 3,
      }
    }

    form = described_class.request_invoice(params)
    expect(form.valid?).to be true
    expect(User.find(hr_with_credit_card.id).credits).to eq(6)
  end
end
