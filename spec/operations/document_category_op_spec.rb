require "rails_helper"

RSpec.describe DocumentCategoryOp do

  let(:category) { create(:document_category) }

  it 'index' do
    category
    categories = DocumentCategoryOp.index({})
    expect(categories.count).to be 1
  end

  it 'create' do
    params = {
      document_category: {
        name_translations: {
          en: "foo",
          fr: "bar",
        }
      }
    }
    new_category = DocumentCategoryOp.create(params)
    expect(new_category.valid?).to be true
    expect(DocumentCategory.all.size).to eq 1
    expect(new_category.name_translations['en']).to eq "foo"
  end

  it 'updates' do
    new_translation = "new translation"
    params = {
      id: category.id,
      document_category: {
        name_translations: {
          en: new_translation,
          fr: "nouvelle traduction",
        }
      }
    }

    updated_category = DocumentCategoryOp.update(params)
    expect(updated_category.valid?).to be true
    expect(updated_category.name_translations['en']).to eq new_translation
  end

  it 'delete' do

    params = {
      id: category.id,
    }

    obj = DocumentCategoryOp.delete(params)
    expect(obj.valid?).to be true
    expect(DocumentCategory.find(category.id)).to eq nil
  end
end
