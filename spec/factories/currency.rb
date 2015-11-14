FactoryGirl.define do
  factory :currency do
  end

  factory :cad_currency, parent: :currency do
    code 'CAD'
    name 'Canadian Dollar'
    rate 1.231841
    symbol '$'
  end

  factory :eur_currency, parent: :currency do
    code 'EUR'
    name 'Euro'
    rate 1.231841
    symbol '€'
  end

  factory :usd_currency, parent: :currency do
    code 'USD'
    name 'United States Dollar'
    rate 1.231841
    symbol '$'
  end
end
