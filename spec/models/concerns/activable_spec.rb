require 'rails_helper'

RSpec.describe Activable, :type => :model do

  let(:user) { create(:transferee) }

  it "status" do
    expect(user.status).to be :active

    user.closed = true
    expect(user.status).to be :closed

    user.expire_at = Date.today - 1.day
    expect(user.status).to be :expired

    user.activated = false
    expect(user.status).to be :unconfirmed
  end
end
