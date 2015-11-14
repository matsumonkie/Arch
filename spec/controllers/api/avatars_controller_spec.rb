require "rails_helper"

RSpec.describe Api::AvatarsController do

  let(:user) { create(:transferee) }
  let(:image) { build(:image) }

  it 'updates' do
    login_as(user)
    params = {
      user_id: user,
      avatar: {
        image: image.data_uri
      }
    }
    put :update, params
    expect(response).to be_success
  end
end
