require 'rails_helper'

RSpec.describe LabeledNoteForm, :type => :form do

  it "validate" do
    params = {
      labeled_note: {
        content: "some content",
        label: "some label",
      }
    }

    form = described_class.new(LabeledNote.new, params)
    expect(form.valid?).to be true
  end
end
