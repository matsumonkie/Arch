require 'rails_helper'

RSpec.describe Ability, :type => :model do

  let(:admin)   { Ability.new(create(:admin))   }
  let(:regular) { Ability.new(create(:regular)) }
  let(:visitor) { Ability.new(create(:visitor)) }

  it "set correct abilities" do
    expect(admin.can?(:do_common_thing, SpecModel)).to be true
    expect(regular.can?(:do_common_thing, SpecModel)).to be true
    expect(visitor.can?(:do_common_thing, SpecModel)).to be true

    expect(admin.can?(:do_crazy_thing, SpecModel)).to be true
    expect(regular.can?(:do_crazy_thing, SpecModel)).to be false
    expect(visitor.can?(:do_crazy_thing, SpecModel)).to be false

    expect(admin.can?(:do_regular_thing, SpecModel)).to be true
    expect(regular.can?(:do_regular_thing, SpecModel)).to be true
    expect(visitor.can?(:do_regular_thing, SpecModel)).to be false

    expect(admin.can?(:do_visitor_thing, SpecModel)).to be true
    expect(regular.can?(:do_visitor_thing, SpecModel)).to be true
    expect(visitor.can?(:do_visitor_thing, SpecModel)).to be true
  end
end
