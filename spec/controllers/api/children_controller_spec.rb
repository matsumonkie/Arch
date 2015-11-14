require "rails_helper"

RSpec.describe Api::ChildrenController do

  let(:child) { build(:child) }
  let(:user_with_children)    { create(:transferee, children: [child]) }
  let(:user_without_children) { create(:transferee) }

  it 'create' do
    login_as(user_without_children)
    params = {
      user_id: user_without_children.id,
      child: {
        firstname: "A",
        lastname: "B",
        birthdate: Date.today,
      }
    }
    post :create, params
    expect(response).to be_success
  end

  it 'update' do
    login_as(user_with_children)
    params = {
      user_id: user_with_children.id,
      id: child.id,
      child: {
        firstname: "Lya",
        lastname: "B",
        birthdate: Date.today,
      }
    }

    put :update, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(user_with_children)
    params = {
      user_id: user_with_children.id,
      id: child.id,
    }

    delete :destroy, params
    expect(response).to be_success
  end
end
