require "rails_helper"

RSpec.describe DemoRequestsController do

  before(:each) do
    request.env["HTTP_REFERER"] = "/"
  end

  it 'create' do
    params = {
      demo_request: {
        firsname: "firstname",
        lastname: "lastname",
        company: "company",
        job: "job",
        email: "email@email.email",
      }
    }

    post :create, params
    expect(response.status).to eq(302)
  end

  it 'doesnt create' do
    params = {
      demo_request: {
        firsname: "firstname",
        lastname: "lastname",
        company: "company",
        job: "job",
        email: "wrong email",
      }
    }

    post :create, params
    expect(response).not_to be_successful
  end
end
