require "rails_helper"

RSpec.describe Api::TodosController do

  let(:category) { create(:todo_category) }
  let(:todo) { build(:todo, todo_category: category, default: false, assignee_id: user_without_todos.id) }
  let(:default_todo) { build(:todo, todo_category: category, default: true) }
  let(:user_with_todos)    { create(:transferee, todos: [default_todo, todo]) }
  let(:user_without_todos) { create(:transferee) }

  it 'index' do
    login_as(user_without_todos)
    params = {
      user_id: user_without_todos.id,
    }

    get :index, params
    expect(response).to be_success
  end

  it 'create' do
    login_as(user_without_todos)
    params = {
      user_id: user_without_todos.id,
      todo: {
        todo_category_id: category.id,
        assignee_id: user_without_todos,
        name: "todo-name",
        hided: false,
        shared: false,
        due_date: Date.today,
      }
    }

    post :create, params
    expect(response).to be_success
  end

  it 'update' do
    login_as(user_with_todos)
    params = {
      user_id: user_with_todos.id,
      id: todo.id,
      todo: {
        todo_category_id: category.id,
        assignee_id: user_with_todos,
        name: "todo-name",
        hided: false,
        shared: false,
        due_date: Date.today,
      }
    }

    put :update, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(user_with_todos)
    params = {
      user_id: user_with_todos.id,
      id: todo.id,
    }
    delete :destroy, params
    expect(response).to be_success
  end
end
