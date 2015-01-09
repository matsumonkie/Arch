require 'rails_helper'

RSpec.describe Role, :type => :model do

  let(:user) { build(:regular) }

  module SpecRole
    def do_something
      1
    end
  end

  it "play role" do
    user.play(SpecRole) do |user|
      expect(user.respond_to?(:do_something)).to be true
      expect(user.do_something()).to eq(1)
    end
    expect(user.respond_to?(:do_something)).to_not be true
  end

  it "raise error on no method found" do
    user.play(SpecRole) do |user|
      expect { user.do_something_else() }.to raise_error(NoMethodError)
    end
    expect(user.respond_to?(:do_something)).to_not be true
  end

end
