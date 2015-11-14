require "rails_helper"

RSpec.describe PasswordOp do

  let(:user) { create(:transferee) }

  it 'same' do
    params = {
      user_id: user.id,
      password: "12345678"
    }
    same = described_class.same?(user_id: user.id, password: "12345678")
    expect(same).to be true
    same = described_class.same?(user_id: user.id, password: "123456789")
    expect(same).to be false
  end

  it 'encrypt password' do
    u = User.find(user)
    new_password = "123456789"
    described_class.encrypt(u, new_password)
    res = described_class.same?(user_id: u.id, password: new_password)
    expect(res).to be true
  end

  it 'doesnt change' do
    params = {
      user_id: user.id,
      password: {
        current_password: "wrong",
        new_password: "123456789",
        password_repetition: "123456789"
      }
    }

    res = described_class.change(params)
    expect(res.valid?).to be false
    expect(res.errors.keys).to include :current_password
  end

  it 'change' do
    params = {
      user_id: user.id,
      password: {
        current_password: "12345678",
        new_password: "123456789",
        password_repetition: "123456789"
      }
    }

    res = described_class.change(params)
    expect(res.valid?).to be true
  end
end
