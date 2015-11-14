require 'rails_helper'

RSpec.describe TransfereePersonalInformationForm, :type => :form do

  let(:address) { create(:address) }

  it "validate" do
    params = {
      transferee: {
        second_email: "some label",
        phone: "some value",
        birthdate: "some value",
        nationality: "some value",
        position: "some value",
        start_code: "some value",
      }
    }
    form = described_class.new(Transferee.new, params)
    expect(form.valid?).to be true
  end
end
