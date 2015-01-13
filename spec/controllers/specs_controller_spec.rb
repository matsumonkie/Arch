require "rails_helper"

RSpec.describe SpecsController do

  it 'index' do
    expect(ApplicationController.new.model).to eq(:application)
    get :index
    expect(response.status).to eq(403)
  end
end
