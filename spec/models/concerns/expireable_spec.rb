require 'rails_helper'

RSpec.describe Expireable, :type => :model do

  let(:transferee) { create(:transferee) }
  let(:expired_transferee) { create(:transferee, expire_at: (Date.today - 10.days)) }

  it "doesnt expire" do
    expect(transferee.expired?).to be false
  end

  context "postpone expiration date" do

    it 'postpone of 1 year after expiration date if not expired' do
      expect(transferee.expired?).to be false
      date = transferee.expire_at
      transferee.postpone_account_expiration(1.year)
      expect(transferee.expire_at).to eq (date + 1.year)
    end

    it 'postpone of 1 year after today if already expired' do
      expect(expired_transferee.expired?).to be true
      expired_transferee.postpone_account_expiration(1.year)
      date = expired_transferee.expire_at
      expected_date = Date.today + 1.year

      expect(date.month).to eq expected_date.month
      expect(date.day).to eq expected_date.day
    end
  end
end
