require "rails_helper"

RSpec.describe UserOp do

  let(:user) { create(:hr) }
  let(:province) { create(:province) }
  let(:admin) { create(:admin) }
  let(:unactivated_user) { create(:transferee, activated: false) }

  it 'current' do
    current_user = described_class.current(user)
    expect(current_user.id).to eq user.id
  end

  it 'index' do
    users = described_class.index({})
    expect(users.size).to eq(0)

    # lazily create users
    user
    admin

    users = described_class.index({})
    expect(users.size).to eq(2)

    users = described_class.index({ type: admin.type.to_s })
    expect(users.size).to eq(1)
    expect(users.first.email).to eq(admin.email)
  end

  it 'show' do
    user_to_show = described_class.show({ id: user.id })
    expect(user_to_show.type).to eq(user.type)
  end

  it 'create' do
    email = "foo@foo.foo"
    params = {
      user: {
        email: email,
        province_id: province.id,
      }
    }
    user = described_class.create(params)
    expect(user.valid?).to be true
    expect(Hr.last.email).to eq(email)
  end

  it 'update with success' do
    params = {
      id: user.id,
      user: {
        firstname: "coucou",
      }
    }
    updated_user = described_class.update(params)
    expect(updated_user.firstname).to eq(params[:user][:firstname])
    expect(updated_user.errors.any?).to be false
  end

  it 'doesnt update' do
    params = {
      id: user.id,
      user: {
        firstname: "coucou",
        email: "",
      }
    }
    updated_user = described_class.update(params)
    expect(updated_user.errors.any?).to be true
    expect(updated_user.errors.messages.keys).to include(:email)
  end
end
