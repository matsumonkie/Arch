require "rails_helper"

feature 'signin/signout', js: true do

  given(:user) { create(:regular) }

  before { skip }

  scenario 'visitor signin' do
    visit '/'

    find("#signin").click
    within("#signin-form") do
      expect(page).to have_text("email")
      expect(page).to have_text("password")

      fill_in "email", with: user.email
      fill_in "password", with: "12345678"
      find("#user_submit").click
    end
    expect(page).to have_text("signout")
  end

  scenario 'user signout' do
    login_as(user)

    visit '/'
    expect(page).to have_text("signout")

    find("#signout").click
    expect(page).to have_text("signin")
    expect(page).to have_text("signup")
  end
end
