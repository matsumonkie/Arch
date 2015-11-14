require 'rails_helper'

RSpec.describe PetForm, :type => :form do

  let(:pet) { create(:pet) }

  it "validate" do
    params = {
      pet: {
        name: "rex",
        type: "dog"
      }
    }
    form = described_class.new(Pet.new, params)
    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      pet: {
        name: "",
        type: ""
      }
    }
    form = described_class.new(Pet.new, params)
    expect(form.valid?).to be false
    expect(form.errors.keys).to include :name, :type
  end
end
