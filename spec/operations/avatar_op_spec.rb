require "rails_helper"

RSpec.describe AvatarOp do

  let(:user) { create(:transferee) }
  let(:image) { build(:image) }

  it 'update' do
    params = {
      user_id: user,
      avatar: {
        image: image.data_uri
      }
    }
    expect(user.avatar).to eq "default.png"
    new_user = AvatarOp.update(params)
    expect(new_user.avatar).to eq "#{Digest::MD5.hexdigest(user.email)}.jpeg"
  end
end
