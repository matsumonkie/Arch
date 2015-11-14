require "rails_helper"

RSpec.describe Api::LabeledNotesController do

  let(:hr) { create(:hr) }
  let(:user_with_notes) { create(:transferee_with_notes) }
  let(:user) { create(:transferee) }

  it 'index' do
    login_as(user)
    params = {
      user_id: user.id,
    }

    get :index, params
    expect(response).to be_success
  end

  it 'create' do
    login_as(user)
    params = {
      user_id: user.id,
      labeled_note: {
        content: "some content",
        label: "some label",
      }
    }

    post :create, params
    expect(response).to be_success
  end

  it 'update' do
    login_as(user_with_notes)
    params = {
      user_id: user_with_notes.id,
      id: user_with_notes.notes.first.id,
      labeled_note: {
        content: "some new content",
        label: "some new label",
      }
    }

    put :update, params
    expect(response).to be_success
  end

  it 'delete' do
    login_as(user_with_notes)
    params = {
      user_id: user_with_notes.id,
      id: user_with_notes.notes.first.id,
    }
    delete :destroy, params
    expect(response).to be_success
  end
end
