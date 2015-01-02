require "rails_helper"

RSpec.describe UsersController do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST /users' do
    it 'should create and redirect to #show' do
      #post :create, user: { email: 'email@email.com', password: 'password' }
      #expect(response).to render_template('show')
    end
  end
end
