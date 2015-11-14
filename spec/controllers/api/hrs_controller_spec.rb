require "rails_helper"

RSpec.describe Api::HrsController do

  let(:hr) { create(:hr) }

  it 'update' do
    login_as(hr)
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

    put :update, params
    expect(response).to be_success
  end
end
