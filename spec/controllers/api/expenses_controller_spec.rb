require "rails_helper"

RSpec.describe Api::ExpensesController do

  let(:hr) { create(:hr) }
  let(:expense) { build(:expense) }
  let(:user) { create(:transferee, expenses: [expense]) }

  it 'index' do
    login_as(user)
    params = {
      user_id: user.id,
    }

    get :index, params
    expect(response).to be_success
  end

  it 'create' do
    login_as(user)
    params = {
      user_id: user.id,
      expense: {
        title: "tomatoes",
        amount: 10,
        currency: 'CAD',
      }
    }

    post :create, params
    expect(response).to be_success
  end

  it 'update' do
    login_as(user)
    params = {
      user_id: user.id,
      id: expense.id,
      expense: {
        title: "tomatoes",
        amount: 10,
        currency: 'EUR',
      }
    }

    put :update, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(user)
    expect(user.expenses.count).to eq 1
    params = {
      user_id: user.id,
      id: expense.id,
    }

    delete :destroy, params
    expect(response).to be_success
    expect(User.find(user.id).expenses.count).to eq 0
  end

  it 'doesnt delete' do
    login_as(hr)
    params = {
      user_id: user.id,
      id: expense.id,
    }
    delete :destroy, params
    expect(response).not_to be_success
  end
end
