FactoryGirl.define do
  factory :feed do
    id          Feed.generate_id()
    created_at  Time.now.to_i
    date        Time.now.to_i
    name        "some feed"
    subject     "some subject"
    description "some description"
    action      "some action"
    model       "some model"
    to_create { |o| o.save() }
  end
end
