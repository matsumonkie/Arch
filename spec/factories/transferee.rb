FactoryGirl.define do
  factory :transferee do
    firstname "transferee-firstname"
    lastname "transferee-lastname"
    email "t@t.t"
    salt "$2a$10$RueLyR5Rai3wS7kN6gKTtO"
    encrypted_password "$2a$10$RueLyR5Rai3wS7kN6gKTtO1ga22kuzO2ibApG/.8edpphAyy4P9xi"
    activated true
    confirmation_token "6508a6ebff64c1176fb50cd38d46553e"
    closed false
  end

  trait :with_labeled_notes do
    transient do
      nb_notes 5
    end

    notes {
      Array.new(nb_notes) { FactoryGirl.build(:labeled_note) }
    }
  end

  factory :transferee_with_notes, parent: :transferee, traits: [:with_labeled_notes]
end
