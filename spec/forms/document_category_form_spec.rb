require 'rails_helper'

RSpec.describe DocumentCategoryForm, :type => :form do

  it "validate" do
    params = {
      document_category: {
        name_translations: {
          en: "new translation",
          fr: "nouvelle traduction",
        }
      }
    }

    form = described_class.new(DocumentCategory.new, params)
    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      document_category: {
        name_translations: {
          en: "just english"
        }
      }
    }

    form = described_class.new(DocumentCategory.new, params)
    expect(form.valid?).to be false

    params = {
      document_category: {
        name_translations: {
          en: "just english",
          fr: ""
        }
      }
    }

    form = described_class.new(DocumentCategory.new, params)
    expect(form.valid?).to be false
  end
end
