require 'rails_helper'

RSpec.describe UserNoteForm, :type => :form do

  it "validate" do
    params = {
      user_note: {
        content: "some content",
      }
    }

    form = described_class.new(UserNote.new, params)
    expect(form.valid?).to be true
  end
end
