require "rails_helper"

RSpec.describe Api::AppointmentsController do

  let(:appointment) { build(:appointment) }
  let(:user_with_appointments)    { create(:transferee, appointments: [appointment]) }
  let(:user_without_appointments) { create(:transferee) }

  it 'index' do
    login_as(user_without_appointments)
    params = {
      user_id: user_without_appointments.id,
    }

    get :index, params
    expect(response).to be_success
  end

  it 'create' do
    login_as(user_without_appointments)
    params = {
      user_id: user_without_appointments.id,
      appointment: {
        name: "appointment-name",
        content: "appointment-content",
        shared: false,
      }
    }

    post :create, params
    expect(response).to be_success
  end

  it 'update' do
    login_as(user_with_appointments)
    params = {
      user_id: user_with_appointments.id,
      id: appointment.id,
      appointment: {
        name: "new-name",
        content: "new-content",
        shared: false,
      }
    }

    put :update, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(user_with_appointments)
    params = {
      user_id: user_with_appointments.id,
      id: appointment.id,
    }
    delete :destroy, params
    expect(response).to be_success
  end
end
