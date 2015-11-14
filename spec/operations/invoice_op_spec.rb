require "rails_helper"

RSpec.describe InvoiceOp do

  let(:package1) { create(:package1) }
  let(:package2) { create(:package2) }
  let(:purchase1) { build(:purchase, package: package1, quantity: 1) }
  let(:purchase2) { build(:purchase, package: package2, quantity: 2) }
  let(:province) { create(:province) }
  let(:hr) { create(:hr, province_id: province.id) }

  it 'create' do
    params = {
      user_id: hr.id.to_s,
      purchases: [purchase1, purchase2]
    }

    expect(hr.invoices.first).to eq nil
    described_class.create(params)
    invoice = User.find(hr.id).invoices.first
    expect(invoice.purchases.size).to eq(2)
  end
end
