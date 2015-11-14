require "rails_helper"

RSpec.describe AbstractDocumentOp do

  let(:document) { create(:abstract_document) }
  let(:category) { create(:document_category) }

  it 'index' do
    document # lazy creation
    documents = AbstractDocumentOp.index({})
    expect(documents.size).to eq 1
  end

  it'create' do
    params = {
      abstract_document: {
        document_category_id: category.id,
        name_translations: {
          en: "new translation",
          fr: "nouvelle traduction",
        }
      }
    }
    document = AbstractDocumentOp.create(params)
    expect(document.valid?).to be true
  end

  it 'update' do
    params = {
      id: document.id,
      abstract_document: {
        document_category_id: category.id,
        name_translations: {
          en: "new translation",
          fr: "nouvelle traduction",
        }
      }
    }

    updated_document = AbstractDocumentOp.update(params)
    expect(updated_document.valid?).to be true
    new_translation = AbstractDocument.find(document).name_translations['en']
    expect(new_translation).to eq "new translation"
  end
end
