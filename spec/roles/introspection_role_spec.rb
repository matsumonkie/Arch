require 'rails_helper'

RSpec.describe IntrospectionRole, :type => :role do

  it "introspects" do
    res = User.new.play(IntrospectionRole) do |user|
      user.who_am_i("admin")
    end
    expect(res).to eq(Admin)

    expect {
      User.new.play(IntrospectionRole) do |user|
        user.who_am_i("whatever")
      end
    }.to raise_error ArgumentError

    res = User.new.play(IntrospectionRole) do |user|
      user.who_am_i("whatever") { User }
    end
    expect(res).to eq(User)
  end
end
