require "rails_helper"

RSpec.describe DemoRequestOp do

  it'create' do
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

    demo = DemoRequestOp.create(params)
    expect(demo.valid?).to be true
  end
end
