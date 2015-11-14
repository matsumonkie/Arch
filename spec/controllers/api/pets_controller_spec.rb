require "rails_helper"

RSpec.describe Api::PetsController do

  let(:pet) { build(:pet) }
  let(:user_with_pets)    { create(:transferee, pets: [pet]) }
  let(:user_without_pets) { create(:transferee) }

  it 'create' do
    login_as(user_without_pets)
    params = {
      user_id: user_without_pets.id,
      pet: {
        name: "rex",
        type: "dog",
      }
    }
    post :create, params
    expect(response).to be_success
  end

  it 'update' do
    login_as(user_with_pets)
    params = {
      user_id: user_with_pets.id,
      id: pet.id,
      pet: {
        name: "croquette",
        type: "cat",
      }
    }

    put :update, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(user_with_pets)
    params = {
      user_id: user_with_pets.id,
      id: pet.id,
    }

    delete :destroy, params
    expect(response).to be_success
  end
end
