require 'rails_helper'

RSpec.describe NewMessageForm, :type => :form do

  let(:user) { create(:hr) }

  it "validate" do
    params = {
      message: {
        content: "coucou",
        author_id: user.id,
      }
    }

    form = NewMessageForm.new(Message.new, params)
    expect(form.valid?).to be true
  end

  it "validate" do
    params = {
      message: {
        content: "",
        author_id: nil,
      }
    }
    form = NewMessageForm.new(Message.new, params)

    expect(form.valid?).to be false
    expect(form.errors.keys).to include :content
  end
end
