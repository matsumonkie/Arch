require 'rails_helper'

RSpec.describe UserForm, :type => :form do

  it "validate" do
    params = {
      user: {
        firstname: "firstname",
        lastname: "lastname"
      }
    }
    form = UserForm.new(User.new, params)
    expect(form.valid?).to be true
  end

  it "invalidate" do
    params = {
      user: {}
    }

    form = UserForm.new(User.new, params)
    expect(form.valid?).to be false
    expect(form.errors.keys).to include :firstname, :lastname
  end
end
