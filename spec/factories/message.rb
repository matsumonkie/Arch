FactoryGirl.define do
  factory :message do
    content
  end
end

FactoryGirl.define do
  sequence :content do |n|
    "some content #{n}"
  end
end
