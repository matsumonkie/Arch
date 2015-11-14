FactoryGirl.define do
  factory :package do
    name "package-name"
    features ["feature1", "feature2", "feature3"]
    price 1000

    factory :package1 do
      price 100
    end
    factory :package2 do
      price 200
    end
    factory :package3 do
      price 300
    end
  end
end
