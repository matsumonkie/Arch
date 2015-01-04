require "rails_helper"

RSpec.describe UsersController do

  describe 'GET #index' do

    it 'index' do
      get :index
      expect(response).to render_template('index')
    end
=begin
    it 'show' do
      get :show
      expect(response).to be_success
    end
=end
  end
end
