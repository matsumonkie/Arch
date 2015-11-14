FactoryGirl.define do
  factory :hr do
    firstname "hr-firstname"
    lastname  "hr-lastname"
    email "h@h.h"
    encrypted_password "$2a$10$jqYYDCxw64b3Vu9EE25B.uPJGX9oL.MILN6HjyVTqicwVqvSDmAAO"
    salt "$2a$10$jqYYDCxw64b3Vu9EE25B.u"
    activated true
    confirmation_token "e4e262fec46e2b5c50daa011063e084c"

    factory :hr_with_credit_card do
      stripe_id 'cus_5p2MVKUMN4ZZAF'
    end
  end

  trait :with_transferees do
    transient do
      nb 5
    end

    transferees {
      Array.new(nb) { FactoryGirl.build(:transferee) }
    }
  end

  trait :with_user_notes do
    transient do
      nb 5
    end

    notes {
      Array.new(nb) { FactoryGirl.build(:user_note) }
    }
  end

  factory :hr_with_notes, parent: :hr, traits: [:with_user_notes]
end
