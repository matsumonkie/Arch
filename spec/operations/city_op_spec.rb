require "rails_helper"

RSpec.describe CityOp do

  let(:city) { create(:city) }

  it 'index' do
    city
    cities = described_class.index({})
    expect(cities.size).to eq 1
  end

  it 'create' do
    params = {
      city: {
        name_translations: {
          en: "Montreal",
          fr: "Montréal",
        }
      }
    }
    new_city = described_class.create(params)
    expect(new_city.valid?).to be true
  end

  it 'update' do
    params = {
      id: city.id,
      city: {
        name_translations: {
          en: "Montreal2",
          fr: "Montréal2",
        }
      }
    }
    updated_city = described_class.update(params)
    expect(updated_city.valid?).to be true
    expect(City.find(city).code).to eq :montreal2
  end

  it 'delete' do
    params = { id: city.id }
    described_class.delete(params)
    expect(City.find(city)).to be nil
  end
end
