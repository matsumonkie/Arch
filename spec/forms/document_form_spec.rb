require 'rails_helper'

RSpec.describe DocumentForm, :type => :form do

  let(:category) { create(:document_category) }

  it "validate" do
    params = {
      document: {
        name: "arusite",
        collected: true,
        hided: false,
        scanned: true,
        due_date: Date.today,
      }
    }
    form = DocumentForm.new(Document.new, params)
    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      document: {
        collected: true,
        hided: false,
        scanned: nil,
        due_date: nil,
      }
    }

    form = DocumentForm.new(Document.new, params)
    expect(form.valid?).to be false
    expect(form.errors.keys).to include :scanned, :name
  end
end
