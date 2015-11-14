require "rails_helper"

RSpec.describe PetOp do

  let(:pet) { build(:pet) }
  let(:user_with_pets)    { create(:transferee, pets: [pet]) }
  let(:user_without_pets) { create(:transferee) }

  it 'create' do
    params = {
      user_id: user_without_pets.id,
      pet: {
        name: "rex",
        type: "dog",
      }
    }

    expect(user_without_pets.pets.count).to eq(0)
    form = described_class.create(params)
    expect(form.valid?).to be true
    expect(Transferee.find(user_without_pets).pets.count).to eq(1)
  end

  it 'update' do
    params = {
      user_id: user_with_pets.id,
      id: pet.id,
      pet: {
        name: "croquette",
        type: "cat",
      }
    }

    expect(user_with_pets.pets.first.name).to eq("rex")
    form = described_class.update(params)
    expect(form.valid?).to be true
    expect(form.name).to eq("croquette")
  end

  it 'delete' do
    params = {
      user_id: user_with_pets.id,
      id: pet.id,
    }

    expect(user_with_pets.pets.count).to eq(1)
    form = described_class.delete(params)
    pets = User.find(user_with_pets).pets
    expect(pets.count).to eq(0)
  end
end
