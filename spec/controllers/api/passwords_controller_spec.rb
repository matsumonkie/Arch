require "rails_helper"

RSpec.describe Api::PasswordsController do

  let(:user) { create(:transferee) }

  it 'change' do
    login_as(user)
    params = {
      user_id: user.id,
      password: {
        current_password: "12345678",
        new_password: "123456789",
        password_repetition: "123456789"
      }
    }
    put :update, params
    expect(response).to be_success
  end
end
