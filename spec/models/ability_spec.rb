require 'rails_helper'

RSpec.describe Ability, :type => :model do

  let(:admin)      { Ability.new(create(:admin))   }
  let(:transferee) { Ability.new(create(:transferee)) }
  let(:visitor)    { Ability.new(create(:visitor)) }

  it "set correct abilities" do
  end
end
