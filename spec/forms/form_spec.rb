require 'rails_helper'

RSpec.describe Form, :type => :form do

  it "creates ActionController::Parameters" do
    newForm = Form.new(Object.new)
    Param = ActionController::Parameters
    expect(newForm.send(:whitelist, {}).class).to eq(Param)

    params = Param.new({})
    expect(newForm.send(:whitelist, params).class).to eq(Param)
  end
end
