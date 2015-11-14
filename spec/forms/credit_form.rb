require 'rails_helper'

RSpec.describe CreditForm, :type => :form do

  let(:user) { create(:hr) }

  before(:each) do
    user.play(CreditableRole, :call)
  end

  it "validate" do
    params = {
      credit: {
        nb_credits: 1,
      }
    }
    form = described_class.new(user, params)

    expect(form.valid?).to be true
  end

  it "validate" do
    params = {
      credit: {
        nb_credits: "1",
      }
    }
    form = described_class.new(user, params)

    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      credit: {
        nb_credits: "a",
      }
    }
    form = described_class.new(user, params)
    expect(form.valid?).to be false
  end

  it "doesnt validate" do
    params = {
      credit: {
        nb_credits: -1,
      }
    }
    form = described_class.new(user, params)
    expect(form.valid?).to be false
  end

  it "doesnt validate" do
    params = {
      credit: {
        nb_credits: nil,
      }
    }
    form = described_class.new(user, params)
    expect(form.valid?).to be false
  end
end
