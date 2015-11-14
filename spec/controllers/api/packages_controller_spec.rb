require "rails_helper"

RSpec.describe Api::PackagesController do

  let(:package1) { create(:package1) }
  let(:package2) { create(:package2) }
  let(:package3) { create(:package3) }
  let(:province) { create(:province) }
  let!(:admin) { create(:admin) }
  let(:hr) { create(:hr, package: package1) }
  let(:hr_with_credit_card) { create(:hr_with_credit_card, province_id: province.id) }

  it 'index' do
    get :index
    expect(response).to be_success
  end

  it 'purchase' do
    login_as(hr_with_credit_card)
    params = {
      user_id: hr_with_credit_card.id,
      package: {
        "#{package1.id}": 1,
        "#{package2.id}": 2,
        "#{package3.id}": 3,
      }
    }
    allow_any_instance_of(StripeOp).to receive(:charge) { :whatever }
    put :purchase, params
    expect(response).to be_success
  end

  it 'request invoice' do
    login_as(hr_with_credit_card)
    params = {
      user_id: hr_with_credit_card.id,
      package: {
        "#{package1.id}": 1,
        "#{package2.id}": 2,
        "#{package3.id}": 3,
      }
    }

    put :request_invoice, params
    expect(response).to be_success
  end
end
