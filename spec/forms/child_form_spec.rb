require 'rails_helper'

RSpec.describe ChildForm, :type => :form do

  let(:child) { create(:child) }

  it "validate" do
    params = {
      child: {
        firstname: "A",
        lastname: "B",
        birthdate: Date.today,
      }
    }
    form = described_class.new(Child.new, params)
    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      child: {
        firstname: "",
        lastname: "",
        birthdate: nil,
      }
    }
    form = described_class.new(Child.new, params)
    expect(form.valid?).to be false
  end
end
