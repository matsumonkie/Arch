FactoryGirl.define do
  factory :demo_user do
    firstname "demo-user-firstname"
    lastname  "demo-user-lastname"
    association :user, factory: :admin
    activated true
    confirmation_token "8bd133a8c91e97efa1b479d57045c17c"
  end
end
