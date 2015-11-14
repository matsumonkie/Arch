require 'rails_helper'

RSpec.describe Form, :type => :form do

  it "creates ActionController::Parameters" do
    newForm = Form.new(SpecModel.new)
    Param = ActionController::Parameters
    expect(newForm.send(:whitelist, {}).class).to eq(Param)

    params = Param.new({})
    expect(newForm.send(:whitelist, params).class).to eq(Param)
  end

  it "delegates" do
    newForm = Form.new(SpecModel.new)
    expect(newForm.delegated.class).to eq SpecModel
  end

  it "accept params as a second arg" do
    expect {
      Form.new(SpecModel.new, {})
    }.to_not raise_error
  end

  it 'returns the last created form' do
    grandfather_form = Form.new(SpecModel.new, {})
    father_form = Form.new(SpecModel.new, {})
    son_form = Form.new(SpecModel.new, {})

    res = grandfather_form.tip do |form|
      father_form.tip do |form|
        son_form.tip do |form|
          :whatever
        end
      end
    end

    expect(res).not_to eq grandfather_form
    expect(res).not_to eq father_form
    expect(res).to     eq son_form

    res = grandfather_form.tip do |form|
      father_form.tip do |form|
        son_form.tip do |form|
          :something
        end

        :something_else
      end
    end

    expect(res).not_to eq grandfather_form
    expect(res).to     eq father_form
    expect(res).not_to eq son_form
  end
end
