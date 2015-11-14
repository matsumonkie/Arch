require "rails_helper"

RSpec.describe MessageOp do

  let(:message) { build(:message) }
  let(:transferee) { create(:transferee) }
  let(:transferee_with_messages) { create(:transferee, messages: [message]) }
  let(:hr) { create(:hr) }

  it 'index' do
    params = {
      user_id: transferee_with_messages.id
    }
    expect(transferee_with_messages.messages.count).to eq 1
    messages = MessageOp.index(params)
    expect(messages.count).to eq 1
    expect(messages.first.id).to eq message.id

    params = {
      user_id: transferee_with_messages.id,
      last_message_id: message.id.to_s
    }

    messages = MessageOp.index(params)
    expect(messages.count).to eq 0
  end

  it 'create' do
    params = {
      user_id: transferee.id,
      message: {
        content: "coucou",
        author_id: hr.id,
      }
    }

    expect(transferee.messages.count).to eq 0
    MessageOp.create(params)
    expect(User.find(transferee).messages.count).to eq 1
  end
end
