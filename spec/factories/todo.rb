FactoryGirl.define do
  factory :todo do
    name "todo-name"
    hided false
    shared false
    due_date Date.today
  end
end
