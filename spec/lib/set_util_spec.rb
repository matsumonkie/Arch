require 'rails_helper'

RSpec.describe SetUtil, :type => :lib do

  include SetUtil

  it "is true" do
    res = SetUtil.same? [:a], [:a]
    expect(res).to be true

    res = SetUtil.same? ['b', 'a'], ['a', 'b']
    expect(res).to be true

    res = SetUtil.same? [], []
    expect(res).to be true
  end

  it 'is false' do
    res = SetUtil.same? [:a, :b], [:a]
    expect(res).to be false

    res = SetUtil.same? [:a], [:b]
    expect(res).to be false

    res = SetUtil.same? [:a], [:a, :b]
    expect(res).to be false

    res = SetUtil.same? ['a'], [:a]
    expect(res).to be false
  end
end
