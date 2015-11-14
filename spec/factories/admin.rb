FactoryGirl.define do
  factory :admin do
    firstname "admin-firstname"
    lastname  "admin-lastname"
    email "admin@admin.admin"
    activated true
    confirmation_token "d0d03593466c2e70af0c5125934c80a8"
  end
end
