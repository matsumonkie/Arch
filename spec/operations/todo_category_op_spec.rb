require "rails_helper"

RSpec.describe TodoCategoryOp do

  let(:category) { create(:todo_category) }

  it 'index' do
    category
    categories = described_class.index({})
    expect(categories.count).to be 1
  end

  it 'create' do
    params = {
      todo_category: {
        name_translations: {
          en: "foo",
          fr: "bar",
        }
      }
    }
    new_category = described_class.create(params)
    expect(new_category.valid?).to be true
    expect(TodoCategory.all.size).to eq 1
    expect(new_category.name_translations['en']).to eq "foo"
  end

  it 'updates' do
    new_translation = "new translation"
    params = {
      id: category.id,
      todo_category: {
        name_translations: {
          en: new_translation,
          fr: "nouvelle traduction",
        }
      }
    }

    updated_category = described_class.update(params)
    expect(updated_category.valid?).to be true
    expect(updated_category.name_translations['en']).to eq new_translation
  end
end
