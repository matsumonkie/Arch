require "rails_helper"

RSpec.describe TranslationOp do

  it "translate" do
    expect(TranslationOp.show({ id: 'spec' })).to eq({ foo: 'bar' })
    expect(TranslationOp.show({ id: 'whatever' })).to eq({})
  end
end
