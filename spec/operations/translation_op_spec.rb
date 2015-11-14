require "rails_helper"

RSpec.describe TranslationOp do

  it "translate" do
    expect(TranslationOp.index({ id: ['spec'] })).to eq({ spec: { foo: 'bar' }})
  end
end
