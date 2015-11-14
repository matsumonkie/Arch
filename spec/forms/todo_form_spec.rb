require 'rails_helper'

RSpec.describe TodoForm, :type => :form do

  let(:todo) { create(:todo) }

  it "validate" do
    params = {
      todo: {
        name: "todo-name",
        hided: false,
        shared: false,
        due_date: Date.today,
      }
    }

    form = described_class.new(Todo.new, params)

    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      todo: {
        name: "",
      }
    }
    form = described_class.new(Todo.new, params)
    expect(form.valid?).to be false
    expect(form.errors.keys).to include :name
  end
end
