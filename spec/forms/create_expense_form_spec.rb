require 'rails_helper'

RSpec.describe ExpenseForm, :type => :form do

  let(:hr) { create(:hr) }
  let(:user) { create(:transferee) }

  it "validate" do
    params = {
      expense: {
        title: "tomatoes",
        amount: 10,
        currency: 'CAD',
      }
    }

    form = ExpenseForm.new(Expense.new, params)
    expect(form.valid?).to be true
  end

  it "doenst validate" do
    params = {
      expense: {
        title: "",
        amount: -10
      }
    }

    form = ExpenseForm.new(Expense.new, params)
    expect(form.valid?).to be false
    expect(form.errors.keys).to include :amount, :title, :currency
  end
end
