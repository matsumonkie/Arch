require "rails_helper"

RSpec.describe DocumentOp do

  let(:document) { build(:document) }
  let(:transferee) { create(:transferee, documents: [document]) }
  let(:category) { create(:document_category) }

  it 'index' do
    document # lazy creation
    params = {
      user_id: transferee.id
    }
    documents = DocumentOp.index(params)
    expect(documents.size).to eq 1
  end

  it "update" do
    params = {
      user_id: transferee.id,
      id: document.id,
      document: {
        collected: true,
        hided: true,
        scanned: true,
        due_date: Date.today,
      }
    }

    document = DocumentOp.update(params)
    expect(document.valid?).to be true
  end
end
