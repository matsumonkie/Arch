require "rails_helper"

RSpec.describe ExpenseOp do

  let(:user) { create(:transferee) }
  let(:expense) { build(:expense) }
  let(:user_with_expense) { create(:transferee, expenses: [expense]) }


  it 'index' do
    params = {
      user_id: user_with_expense.id
    }
    expenses = described_class.index(params)
    expect(expenses.count).to eq 1
  end

  it 'create' do
    params = {
      user_id: user.id,
      expense: {
        title: "tomatoes",
        amount: 10,
        currency: 'CAD'
      }
    }
    expect(user.expenses.count).to eq 0
    new_user = described_class.create(params)
    expect(new_user.valid?).to be true
    expect(User.find(user.id).expenses.count).to eq 1
  end

  it 'update' do
    params = {
      user_id: user_with_expense.id,
      id: expense.id,
      expense: {
        title: "new_title",
        amount: 99,
        currency: 'EUR'
      }
    }
    expense = described_class.update(params)
    expect(expense.valid?).to be true
    expect(User.find(user_with_expense.id).expenses.first.title).to eq "new_title"
  end
end
