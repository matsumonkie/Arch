require 'rails_helper'

RSpec.describe ChangePasswordForm, :type => :form do

  let(:user) { create(:transferee) }

  it "validate" do
    params = {
      password: {
        new_password: "12345678",
        password_repetition: "12345678",
      }
    }
    user.play(ChangePasswordRole, :call)
    form = described_class.new(user, params)
    expect(form.valid?).to be true
  end

  it "validate" do
    params = {
      password: {
        new_password: "a",
        password_repetition: "b",
      }
    }
    user.play(ChangePasswordRole, :call)
    form = described_class.new(user, params)
    expect(form.valid?).to be false
  end
end
