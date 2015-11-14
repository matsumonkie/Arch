require 'rails_helper'

RSpec.describe DemoUser, :type => :model do

  let(:demo_user) { create(:demo_user, { user: admin }) }
  let(:admin)     { create(:admin) }
  let(:hr)        { create(:hr) }

  it "wraps a user" do
    expect(demo_user.demo_user?()).to be true
    expect(demo_user.type).to eq(:admin)
  end

  it "change its type" do
    expect(demo_user.type).to eq(:admin)
    hr
    params = {
      demo_user: {
        role: 'Hr'
      }
    }
    new_demo_user = DemoUserOp.update(params)
    expect(new_demo_user.type).to eq(:hr)
  end
end
