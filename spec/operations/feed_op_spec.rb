require "rails_helper"

RSpec.describe FeedOp do

  let(:hr) { create(:hr) }
  let(:transferee_with_feeds) { create(:transferee, hr: hr) }
  let(:transferee_without_feeds) { create(:transferee, hr: hr) }
  let(:feed) { create(:feed, stakeholder_id: transferee_with_feeds.id) }

  it 'index' do
    feed
    expect(described_class.index({ user_id: transferee_with_feeds.id }).size).to eq 1
    expect(described_class.index({ user_id: transferee_without_feeds.id }).size).to eq 0
  end

  it 'create' do
    params = {
      feed: {
        author_id: transferee_without_feeds.id,
        stakeholder_ids: [ hr.id ],
        action: 'create',
        model: 'expense',
      }
    }
    expect(described_class.index({ user_id: hr.id }).size).to eq 0
    new_feed = described_class.create(params)
    feeds = described_class.index({ user_id: hr.id })
    expect(feeds.size).to eq 1
  end

  it 'delete' do
    feed
    params = {
      user_id: feed.stakeholder_id,
      id: feed.id,
    }
    expect(described_class.index({ user_id: feed.stakeholder_id }).size).to eq 1
    described_class.delete(params)
    expect(described_class.index({ user_id: feed.stakeholder_id }).size).to eq 0
  end
end
