require "rails_helper"

RSpec.describe UserNoteOp do

  let(:user) { create(:hr, :with_transferees) }
  let(:user_with_notes) { create(:hr_with_notes) }

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
      user_note: {
        content: "some content",
        assignee_id: user.transferees.first.id,
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
      user_note: {
        content: "some new content",
        assignee_id: user_with_notes.notes.first.assignee.id,
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
