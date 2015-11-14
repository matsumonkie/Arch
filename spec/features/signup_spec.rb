require "rails_helper"

feature 'signin/signout', js: true do

  given(:user) { create(:hr) }

  before { skip }

  scenario 'visitor signin' do
    visit '/'

    find("#signup").click
    within("#signup-form") do
      expect(page).to have_text("email")
      expect(page).to have_text("password")
      expect(page).to have_text("check password")

      fill_in "user_email", with: user.email
      fill_in "user_password", with: "12345678"
      fill_in "user_password_repetition", with: "12345678"

      find("#user_submit").click
    end
    expect(page).to have_text("signout")
  end
end
