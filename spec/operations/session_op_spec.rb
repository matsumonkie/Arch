require "rails_helper"

RSpec.describe SessionOp do

  let(:user) { create(:hr) }

  it "return user if valid password" do
    params = {
      session: {
        email: user.email,
        password: "12345678"
      }
    }
    user = SessionOp.create(params)
    expect(user.valid?).to be true
  end

  it "return false if invalid email" do
    params = {
      session: {
        email: "invalid@invalid.invalid",
        password: "12345678"
      }
    }
    user = SessionOp.create(params)
    expect(user.valid?).to be false
  end

  it "return false if invalid password" do
    params = {
      session: {
        email: user.email,
        password: "invalid_password"
      }
    }
    user = SessionOp.create(params)
    expect(user.valid?).to be false
  end
end
