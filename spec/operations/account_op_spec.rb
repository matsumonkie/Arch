require "rails_helper"

RSpec.describe AccountOp do

  let(:transferee) { create(:transferee) }
  let(:user) { create(:hr) }
  let(:closed_transferee) { create(:transferee, closed: true) }
  let(:hr) { create(:hr) }
  let(:unactivated_user) { create(:transferee, activated: false) }
  let(:admin) { create(:admin) }

  it 'confirm' do
    params = {
      email: unactivated_user.email,
      confirmation_token: unactivated_user.confirmation_token,
    }

    expect(unactivated_user.activated).to be false
    user = described_class.confirm(params)
    expect(user.valid?).to be true
  end

  it 'doesnt confirm' do
    params = {
      email: admin.email,
      confirmation_token: "whatever",
    }

    user = described_class.confirm(params)
    expect(!!user).to be false
  end

  it 'doesnt confirm' do
    params = {
      email: "whatever",
      confirmation_token: "whatever",
    }

    user = described_class.confirm(params)
    expect(!!user).to be false
  end

  it 'doesnt confirm' do
    params = {
      email: unactivated_user.email,
      confirmation_token: "whatever",
    }

    user = described_class.confirm(params)
    expect(!!user).to be false
  end

  it 'activate' do
    params = {
      id: unactivated_user.id,
      account: {
        email: unactivated_user.email,
        confirmation_token: unactivated_user.confirmation_token,
        password: "12345678",
        password_repetition: "12345678",
      }
    }

    user = described_class.activate(params)
    expect(user.valid?).to be true
    expect(user.encrypted_password.size).to be > 5

    created_user = User.last
    created_user.play(PasswordRole) do |user|
      expect(user.same_password?("12345678")).to be true
    end
  end

  it 'doesnt activate' do
    params = {
      id: unactivated_user.id,
      account: {
        email: unactivated_user.email,
        confirmation_token: unactivated_user.confirmation_token,
        password: "12345678",
        password_repetition: "123456789",
      }
    }

    user = described_class.activate(params)
    expect(user.valid?).to be false
  end

  it 'close' do
    params = {
      user_id: hr.id,
      id: transferee.id
    }
    expect(transferee.closed).to be false
    user = described_class.close(params)
    expect(user.closed).to be true
  end

  it 'reopen' do
    params = {
      user_id: hr.id,
      id: closed_transferee.id
    }
    expect(closed_transferee.closed).to be true
    user = described_class.reopen(params)
    expect(user.closed).to be false
    expect(User.find(hr).credits).to eq 0
  end

  it 'delete' do
    params = {
      user_id: hr.id,
      id: transferee.id
    }
    user = described_class.delete(params)
    expect(User.find(transferee.id)).to be nil
  end

  it 'reset password' do
    params = {
      account: {
        email: user.email
      }
    }

    expect(user.confirmation_token.size).to be > 1
    new_user = described_class.reset_password(params)
    expect(new_user).not_to be false
    expect(new_user.confirmation_token).not_to eq(user.confirmation_token)
    expect(new_user.confirmation_token.size).to be > 1
  end

  it 'doesnt reset password' do
    params = {
      account: {
        email: 'whatever'
      }
    }
    new_user = described_class.reset_password(params)
    expect(!!new_user).to be false
  end
end
