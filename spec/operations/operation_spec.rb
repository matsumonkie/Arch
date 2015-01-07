require "rails_helper"

RSpec.describe Operation do

  def nb_methods(klass)
    (klass.public_methods - Object.public_methods).size
  end

  it 'respond_to anything' do
    expect(UserOp.respond_to?(:index)).to be true
  end

  it 'dynamically create method' do
    expect(nb_methods(SpecOp)).to eq(nb_methods(Operation))
    a = SpecOp.index({}) # create a method
    expect(nb_methods(SpecOp)).to eq(nb_methods(Operation) + 1)

    b = SpecOp.index({})
    expect(a).to eq(b)
  end

  it 'errors with undefined method' do
    expect { UserOp.undefined_method({}) }.to raise_error(NoMethodError)
  end
end
