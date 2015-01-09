require "rails_helper"

RSpec.describe UserOp do

  let(:user) { create(:regular) }

  it 'index' do
    users = UserOp.index({})
    expect(User.all.size).to eq(0)
  end

  it 'show' do
    user_to_show = UserOp.show({ id: user.id })
    expect(user_to_show.type).to eq(user.type)
  end

  it 'edit' do
    user_to_edit = UserOp.edit({ id: user.id })
    expect(user_to_edit.type).to eq(user.type)
  end

  it 'update' do
    params = ActionController::Parameters.new({
      id: user.id,
      user: {
        firstname: "coucou",
      }
    })
    updated_user = UserOp.update(params)
    expect(updated_user.firstname).to eq(params[:user][:firstname])
  end
end
