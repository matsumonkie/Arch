require 'rails_helper'

RSpec.describe DemoUser, :type => :model do

  let(:admin) { build(:admin) }
  let(:regular) { build(:regular) }
  let(:demo_user) { build(:demo_user, { user: admin }) }

  it "wraps a user" do
    expect(demo_user.demo_user?()).to be true
    expect(demo_user.type).to eq("admin")
  end

  pending "change its type"
end
