require "rails_helper"

RSpec.describe LocaleOp do

  let(:user) { create(:hr) }

  it 'switch languages' do
    expect(user.locale).to eq 'fr'
    updated_user = LocaleOp.switch_to_english(user)
    expect(updated_user.locale).to eq 'en'

    updated_user = LocaleOp.switch_to_french(user)
    expect(updated_user.locale).to eq 'fr'
  end
end
