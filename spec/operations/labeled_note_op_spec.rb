require "rails_helper"

RSpec.describe LabeledNoteOp do

  let(:user) { create(:transferee) }
  let(:user_with_notes) { create(:transferee_with_notes) }
  let(:note) { create(:labeled_note) }

  it 'index' do
    params = {
      user_id: user_with_notes.id,
    }
    res = described_class.index(params)
    expect(res.size).to eq(5)
  end

  it 'create' do
    params = {
      user_id: user.id,
      labeled_note: {
        content: "some content",
        label: "some label",
      }
    }

    res = described_class.create(params)
    expect(res.valid?).to be true
    expect(User.find(user).notes.size).to eq 1
  end

  it 'update' do
    params = {
      user_id: user_with_notes.id,
      id: user_with_notes.notes.first.id,
      labeled_note: {
        content: "some new content",
        label: "some new label",
      }
    }

    res = described_class.update(params)
    expect(res.valid?).to be true
    expect(User.find(user_with_notes).notes.first.content).to eq 'some new content'
  end

  it 'delete' do
    params = {
      user_id: user_with_notes.id,
      id: user_with_notes.notes.first.id,
    }

    res = described_class.delete(params)
    nb_notes = user_with_notes.notes.size
    new_nb_notes = User.find(user_with_notes).notes.size

    expect(new_nb_notes).to eq(nb_notes - 1)
  end
end
