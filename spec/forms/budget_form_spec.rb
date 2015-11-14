require 'rails_helper'

RSpec.describe BudgetForm, :type => :form do

  it "validate" do
    params = {
      budget: {
        shared_budget: 1,
        personal_budget: 1
      }
    }
    form = described_class.new(Transferee.new, params)
    expect(form.valid?).to be true
  end

  it "validate" do
    params = {
      budget: {
        shared_budget: 1,
      }
    }
    form = described_class.new(Transferee.new, params)
    expect(form.valid?).to be true
  end

  it "invalidate" do
    params = {
      budget: {
        shared_budget: -1,
      }
    }
    form = described_class.new(Transferee.new, params)
    expect(form.valid?).to be false
  end
end
