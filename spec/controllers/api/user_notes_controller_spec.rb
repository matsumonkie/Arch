require "rails_helper"

RSpec.describe Api::UserNotesController do

  let(:user_with_notes) { create(:hr_with_notes) }
  let(:user) { create(:hr) }

  it 'index' do
    login_as(user)
    params = {
      user_id: user.id,
    }

    get :index, params
    expect(response).to be_success
  end

  it 'create' do
    login_as(user_with_notes)
    params = {
      user_id: user_with_notes.id,
      id: user_with_notes.notes.first.id,
      user_note: {
        content: "some new content",
        assignee_id: user_with_notes.notes.first.assignee.id,
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
      user_note: {
        content: "some new content",
        assignee_id: user_with_notes.notes.first.assignee.id,
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
