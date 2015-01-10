require "rails_helper"

RSpec.describe SpecsController do

  it 'index' do
    expect(ApplicationController.new.model).to eq(:Application)
    expect{ get :index }.to raise_error(ArgumentError)
  end
end
