require "rails_helper"

RSpec.describe DocumentOp do

  let(:default_document) { build(:document, default: true) }
  let(:document) { build(:document, default: false) }
  let(:transferee) { create(:transferee, documents: [document, default_document]) }
  let(:category) { create(:document_category) }

  it 'index' do
    document # lazy creation
    params = {
      user_id: transferee.id
    }
    documents = described_class.index(params)
    expect(documents.size).to eq 2
  end

  it "create" do
    params = {
      user_id: transferee.id,
      document: {
        name: "test",
        category_id: category.id,
        collected: true,
        hided: true,
        scanned: true,
        due_date: Date.today,
      }
    }

    document = described_class.create(params)
    expect(document.valid?).to be true
    new_document = User.find(transferee).documents.last
    expect(new_document.name).to eq("test")
  end

  it "update" do
    params = {
      user_id: transferee.id,
      id: document.id,
      document: {
        name: "test",
        collected: true,
        hided: true,
        scanned: true,
        due_date: Date.today,
      }
    }

    document = described_class.update(params)
    expect(document.valid?).to be true
  end

  it "delete" do
    params = {
      user_id: transferee.id,
      id: document.id,
    }

    document = described_class.delete(params)
    expect(User.find(transferee).documents.find(document)).to be nil
  end

  it "delete" do
    params = {
      user_id: transferee.id,
      id: default_document.id,
    }

    document = described_class.delete(params)
    expect(User.find(transferee).documents.find(default_document)).not_to be nil
  end
end
