require 'rails_helper'

RSpec.describe AbstractTodoForm, :type => :form do

  let(:category) { create(:todo_category) }

  it "validate" do
    params = {
      abstract_todo: {
        todo_category_id: category.id,
        name_translations: {
          en: "new translation",
          fr: "nouvelle traduction",
        }
      }
    }

    form = described_class.new(AbstractTodo.new, params)
    expect(form.valid?).to be true
  end

  it "invalidate" do
    params = {
      abstract_todo: {
        todo_category: category.id,
        name_translations: {
          en: "",
          fr: "nouvelle traduction",
        }
      }
    }

    form = described_class.new(AbstractTodo.new, params)
    expect(form.valid?).to be false
  end
end
