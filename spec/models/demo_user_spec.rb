require 'rails_helper'

RSpec.describe DemoUser, :type => :model do

  let(:demo_user) { create(:demo_user, { user: admin }) }
  let(:admin) { create(:admin) }
  let(:regular) { create(:regular) }

  it "wraps a user" do
    expect(demo_user.demo_user?()).to be true
    expect(demo_user.type).to eq("admin")
  end

  it "change its type" do
    expect(demo_user.type).to eq("admin")
    new_demo_user = DemoUserOp.update({ id: demo_user.id, type: regular.type })
    expect(new_demo_user.type).to eq("regular")
  end
end
