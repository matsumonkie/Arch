FactoryGirl.define do
  some_rates = {
    CAD: 3.7,
    USD: 60.0,
    EUR: 125.1,
    ZZZ: 'whatever',
  }

  factory :rates, class: OpenStruct do
    disclaimer "Exchange rates are provided for informational purposes only, and do not constitute financial advice of any kind. Although every attempt is made to ensure quality, NO guarantees are given whatsoever of accuracy, validity, availability, or fitness for any purpose - please use at your own risk. All usage is subject to your acceptance of the Terms and Conditions of Service, available at: https://openexchangerates.org/terms/"
    license "Data sourced from various providers with public-facing APIs; copyright may apply; resale is prohibited; no warranties given of any kind. Bitcoin data provided by http://coindesk.com. All usage is subject to your acceptance of the License Agreement available at: https://openexchangerates.org/license/"
    timestamp 1434481261
    base "USD"
    rates some_rates
  end
end
