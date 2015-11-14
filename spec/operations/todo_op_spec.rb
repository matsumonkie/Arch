require "rails_helper"

RSpec.describe TodoOp do

  let(:category) { create(:todo_category) }
  let(:todo) { build(:todo, default: false) }
  let(:default_todo) { build(:todo, default: true) }
  let(:user_with_todos)    { create(:transferee, todos: [todo, default_todo]) }
  let(:user_without_todos) { create(:transferee) }

  it 'index' do
    params = {
      user_id: user_with_todos.id,
    }
    todos = described_class.index(params)
    expect(todos.count).to eq 2
  end

  it 'create' do
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

    expect(user_without_todos.todos.count).to eq(0)
    form = described_class.create(params)
    expect(form.valid?).to be true
    expect(Transferee.find(user_without_todos).todos.count).to eq(1)
  end

  it 'update' do
    params = {
      user_id: user_with_todos.id,
      id: todo.id,
      todo: {
        todo_category_id: category.id,
        assignee_id: user_with_todos,
        name: "wooooooooooooooork",
        hided: false,
        shared: false,
        due_date: Date.today,
      }
    }

    expect(user_with_todos.todos.first.name).to eq(todo.name)
    form = described_class.update(params)
    expect(form.valid?).to be true
    expect(form.name).to eq("wooooooooooooooork")
  end

  it "doenst delete" do
    params = {
      user_id: user_with_todos.id,
      id: default_todo.id,
    }

    todo = described_class.delete(params)
    expect(User.find(user_with_todos).todos.find(default_todo)).not_to be nil
  end

  it "delete" do
    params = {
      user_id: user_with_todos.id,
      id: todo.id,
    }

    todo = described_class.delete(params)
    expect(User.find(user_with_todos).todos.find(todo)).to be nil
  end
end
