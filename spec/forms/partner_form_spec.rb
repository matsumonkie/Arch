require 'rails_helper'

RSpec.describe PartnerForm, :type => :form do

  let(:partner) { create(:partner) }
  let(:transferee) { create(:transferee) }

  it "validate" do
    params = {
      user_id: transferee.id,
      partner: {
        firstname: "some value",
        lastname: "some value",
        email: "some value",
        phone: "some value",
        nationality: "some value",
        birthdate: "some value",
      }
    }
    form = PartnerForm.new(Partner.new, params)
    expect(form.valid?).to be true
  end

  it "doesnt validate" do
    params = {
      user_id: transferee.id,
      partner: {
        firstname: "",
        lastname: "",
      }
    }
    form = PartnerForm.new(Partner.new, params)
    expect(form.valid?).to be false
  end
end
