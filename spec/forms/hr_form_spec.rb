require 'rails_helper'

RSpec.describe HrForm, :type => :form do

  let(:hr) { create(:hr) }

  it "validate" do
    params = {
      hr: {
        email: "email",
        firstname: "firstname",
        lastname: "lastname",
        company: {
          name: "company",
          email: "email",
          phone: "phone",
          address: {
            label: "label",
            civic: "civic",
            city: "city",
            state: "state",
            country: "country",
            postal_code: "postal_code",
          }
        }
      }
    }

    form = described_class.new(Hr.new, params)
    expect(form.valid?).to be true
    expect(form.company.name).to eq "company"
    expect(form.company.address.country).to eq "country"
  end
end
