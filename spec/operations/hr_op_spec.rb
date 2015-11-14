require "rails_helper"

RSpec.describe HrOp do

  let(:hr) { create(:hr) }

  it 'update' do
    params = {
      user_id: hr.id,
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

    form = described_class.update(params)
    expect(form.valid?).to be true
  end
end
