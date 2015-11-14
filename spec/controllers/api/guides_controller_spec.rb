require "rails_helper"

RSpec.describe Api::GuidesController do

  let(:guide) { create(:guide) }
  let(:transferee) { create(:transferee) }

  it 'menu' do
    login_as(transferee)
    params = {
      guide_title: guide.title,
    }
    get :menu, params
    expect(response).to be_success
  end

  it 'index_from_title' do
    login_as(transferee)
    params = {
      guide_title: guide.title,
      title: 'title1',
    }
    get :index_from_title, params
    expect(response).to be_success
  end

  it 'content_from_index' do
    login_as(transferee)
    params = {
      guide_title: guide.title,
      index: '1.1',
    }
    get :content_from_index, params
    expect(response).to be_success
  end

  it 'search' do
    login_as(transferee)
    params = {
      guide_title: guide.title,
      text: 'text for'
    }
    get :search, params
    expect(response).to be_success
  end
end
