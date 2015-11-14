require "rails_helper"

RSpec.describe AppointmentOp do

  let(:appointment) { build(:appointment) }
  let(:user_with_appointments)    { create(:transferee, appointments: [appointment]) }
  let(:user_without_appointments) { create(:transferee) }

  it 'index' do
    params = {
      user_id: user_with_appointments.id,
    }
    appointments = described_class.index(params)
    expect(appointments.count).to eq 1
  end

  it 'create' do
    params = {
      user_id: user_without_appointments.id,
      appointment: {
        name: "appointment-name",
        due_date: Date.today,
        content: "content-name",
        shared: false,
      }
    }

    expect(user_without_appointments.appointments.count).to eq(0)
    form = described_class.create(params)
    expect(form.valid?).to be true
    expect(Transferee.find(user_without_appointments).appointments.count).to eq(1)
  end

  it 'update' do
    params = {
      user_id: user_with_appointments.id,
      id: appointment.id,
      appointment: {
        name: "wooooooooooooooork",
        content: "new-content",
        shared: false,
      }
    }

    expect(user_with_appointments.appointments.first.name).to eq(appointment.name)
    form = described_class.update(params)
    expect(form.valid?).to be true
    expect(form.name).to eq("wooooooooooooooork")
  end

  it "delete" do
    params = {
      user_id: user_with_appointments.id,
      id: appointment.id,
    }

    appointment = described_class.delete(params)
    expect(User.find(user_with_appointments).appointments.find(appointment)).to be nil
  end
end
