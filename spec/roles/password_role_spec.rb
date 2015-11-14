require 'rails_helper'

RSpec.describe PasswordRole, :type => :role do

  it "encrypts password" do
    user = User.new.play(SignableRole, :call)
    user.password = "12345678"
    user.play(PasswordRole) { |u|
      u.encrypt_password(user.password)
    }

    expect(user.encrypted_password).not_to eq("12345678")
    expect(user.encrypted_password.size).to be > 1
    expect(user.salt.size).to be > 1
  end

  let(:user) { create(:hr) }

  it "check passwords" do
    user.play(PasswordRole) do |user|
      unencrypted_password = "12345678"
      res = user.same_password?(unencrypted_password)
      expect(res).to be true
    end

    user.play(PasswordRole) do |user|
      unencrypted_password = "whatever"
      res = user.same_password?(unencrypted_password)
      expect(res).to be false
    end
  end
end
