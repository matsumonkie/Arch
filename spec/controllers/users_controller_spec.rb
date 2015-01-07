require "rails_helper"

RSpec.describe UsersController do

  describe 'GET #index' do

    let(:user) { create(:regular) }

    it 'index' do
      get :index
      expect(response).to render_template('index')
    end

    it 'show' do
      get :show, { id: user }
      expect(response).to be_success
    end

    it 'edit' do
      get :edit, { id: user }
      expect(response).to be_success
    end
  end
end
