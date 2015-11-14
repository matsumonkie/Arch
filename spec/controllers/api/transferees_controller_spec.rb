require "rails_helper"

RSpec.describe Api::TransfereesController do

  describe 'GET #index' do

    let(:package1) { create(:package1) }
    let(:package2) { create(:package2) }
    let(:city) { create(:city) }
    let(:hr_with_packages) {
      create(:hr, packages: { "#{package1.id}": 1, "#{package2.id}": 2 })
    }
    let(:transferee) { create(:transferee, hr: hr_with_packages) }

    it 'index' do
      login_as(hr_with_packages)
      get :index, { user_id: hr_with_packages.id }
      expect(response).to be_success
    end

    it 'doesnt create if email already registered' do
      login_as(hr_with_packages)
      params = {
        user_id: hr_with_packages.id,
        transferee: {
          email: transferee.email,
          firstname: 'firstname',
          lastname: 'lastname',
          position: 'CEO',
          start_date: Date.today,
          shared_budget: 1000,
          city_id: city.id,
          package_id: hr_with_packages.packages.keys.first.to_s,
        }
      }

      post :create, params
      expect(response).not_to be_success
    end

    it 'update' do
      login_as(transferee)
      params = {
        user_id: transferee.id,
        id: transferee.id,
        transferee: {
          second_email: "some email",
          phone: "some value",
          birthdate: "some value",
          nationality: "some value",
          position: "some value",
          start_code: "some value",
        }
      }

      put :update, params
      expect(response).to be_success
    end
  end
end
