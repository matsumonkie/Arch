require 'rails_helper'

RSpec.describe AppointmentForm, :type => :form do

  let(:appointment) { create(:appointment) }

  it "validate" do
    params = {
      appointment: {
        name: "appointment-name",
        content: "coucou",
        shared: false,
      }
    }

    form = described_class.new(Appointment.new, params)
    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      appointment: {
        name: "",
      }
    }
    form = described_class.new(Appointment.new, params)
    expect(form.valid?).to be false
    expect(form.errors.keys).to include :name
  end
end
