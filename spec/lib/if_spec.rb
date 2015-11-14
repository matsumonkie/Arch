require 'rails_helper'

RSpec.describe If, :type => :lib do

  include If

  let(:user) { create(:hr) }

  it "return the same object" do
    expect(
      If(User.find(user.id)) do |user|
        1 + 1
      end.id
    ).to eq user.id

    expect(
      If(42) do |num|
        1 + 1
      end
    ).to eq 42
  end

  it "return the modify the object" do
    expect(
      If(User.find(user.id)) do |user|
        user.firstname = "hey dude"
      end.firstname
    ).to eq "hey dude"
  end

  it "return the deepest 'If' object" do
    res = If(User.find(user.id)) do |user|
      If(42) do |some_value|
        :whatever
      end
    end

    expect(res).to eq 42
  end

  it "doesnt go deeper if 'If' not valid" do
    res = If(nil) do |user|
      If(42) do |some_value|
        :whatever
      end
    end

    expect(res).to eq nil
  end

  it "return last object" do
    res = If(true) do |user|
      If(42) do |some_value|
        If(false) do |thing|
          1
        end
      end
    end

    expect(res.delegated).to be false
  end

  it "return simple result" do
    res = If(true) do |value|
      Return(1)
    end

    expect(res).to eq 1
  end
end
