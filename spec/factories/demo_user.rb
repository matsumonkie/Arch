FactoryGirl.define do
  factory :demo_user do
    firstname "demo-user-firstname"
    lastname  "demo-user-lastname"
    association :user, factory: :admin
  end
end
