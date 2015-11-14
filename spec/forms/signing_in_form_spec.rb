require 'rails_helper'

RSpec.describe SigningInForm, :type => :form do

  let(:user) { create(:hr) }

  it "validates" do
    params = {
      session: {
        email: user.email,
        password: "12345678"
      }
    }

    form = SessionOp.create(params)
    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      session: {
        email: user.email,
        password: "whatever"
      }
    }

    form = SessionOp.create(params)
    expect(form.valid?).to be false
  end
end
