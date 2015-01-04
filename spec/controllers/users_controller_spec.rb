require "rails_helper"

RSpec.describe UsersController do

  describe 'GET #index' do

    let(:user) { create(:user) }

    it 'index' do
      get :index
      expect(response).to render_template('index')
    end

    it 'show' do
      get :show, { id: user }
      expect(response).to be_success
    end
  end
end
