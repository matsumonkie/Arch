FactoryGirl.define do
  factory :user_note do
    content 'a labeled note'
    assignee { FactoryGirl.create(:transferee) }
  end
end
