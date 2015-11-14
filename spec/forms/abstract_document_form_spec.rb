require 'rails_helper'

RSpec.describe AbstractDocumentForm, :type => :form do

  let(:category) { create(:document_category) }

  it "validate" do
    params = {
      abstract_document: {
        document_category_id: category.id,
        name_translations: {
          en: "new translation",
          fr: "nouvelle traduction",
        }
      }
    }

    form = described_class.new(AbstractDocument.new, params)
    expect(form.valid?).to be true
  end

  it "invalidate" do
    params = {
      abstract_document: {
        document_category: category.id,
        name_translations: {
          en: "",
          fr: "nouvelle traduction",
        }
      }
    }

    form = described_class.new(AbstractDocument.new, params)
    expect(form.valid?).to be false
  end
end
