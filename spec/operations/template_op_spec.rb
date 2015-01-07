require "rails_helper"

RSpec.describe TemplateOp do

  it 'return correct templates' do
    template = TemplateOp.show({ id: "spec/regular" })
    expect(template).to eq("templates/spec/regular")
  end
end
