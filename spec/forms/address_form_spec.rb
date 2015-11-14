require 'rails_helper'

RSpec.describe AddressForm, :type => :form do

  let(:address) { create(:address) }

  it "validate" do
    params = {
      address: {
        label: "some label",
        civic: "some value",
        city: "some value",
        state: "some value",
        country: "some value",
        postal_code: "some value",
      }
    }
    form = AddressForm.new(Address.new, params)
    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      address: {
        label:       "",
        civic:       "",
        city:        "",
        state:       "",
        country:     "",
        postal_code: "",
      }
    }

    form = AddressForm.new(Address.new, params)
    expect(form.valid?).to be false
  end
end
