require 'rails_helper'

RSpec.describe CityForm, :type => :form do

  let(:city) { create(:city) }

  it "validate" do
    params = {
      city: {
        name_translations: {
          en: "Montreal",
          fr: "Montréal",
        }
      }
    }

    form = described_class.new(City.new, params)
    expect(form.valid?).to be true
  end

  it "invalidate" do
    params = {
      city: {
        name_translations: {
          en: "",
          fr: "Montréal",
        }
      }
    }

    form = described_class.new(City.new, params)
    expect(form.valid?).to be false
  end
end
