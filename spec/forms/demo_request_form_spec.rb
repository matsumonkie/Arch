require 'rails_helper'

RSpec.describe DemoRequestForm, :type => :form do

  it "validate" do
    params = {
      demo_request: {
        firsname: "firstname",
        lastname: "lastname",
        company: "company",
        job: "job",
        email: "email@email.email",
        phone: "1234567890",
      }
    }

    form = described_class.new(DemoRequest.new, params)
    expect(form.valid?).to be true
  end

  it "invalidate" do
    params = {
      demo_request: {
        email: "wrong_email",
      }
    }

    form = described_class.new(DemoRequest.new, params)
    expect(form.valid?).to be false
    expect(form.errors.keys).to include :email, :phone
  end
end
