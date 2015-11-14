require "rails_helper"

RSpec.describe AbstractTodoOp do

  let(:document) { create(:abstract_todo) }
  let(:category) { create(:todo_category) }

  it 'index' do
    document # lazy creation
    documents = described_class.index({})
    expect(documents.size).to eq 1
  end

  it'create' do
    params = {
      abstract_todo: {
        todo_category_id: category.id,
        name_translations: {
          en: "new translation",
          fr: "nouvelle traduction",
        }
      }
    }
    document = described_class.create(params)
    expect(document.valid?).to be true
  end

  it 'update' do
    params = {
      id: document.id,
      abstract_todo: {
        todo_category_id: category.id,
        name_translations: {
          en: "new translation",
          fr: "nouvelle traduction",
        }
      }
    }

    updated_document = described_class.update(params)
    expect(updated_document.valid?).to be true
    new_translation = AbstractTodo.find(document).name_translations['en']
    expect(new_translation).to eq "new translation"
  end
end
