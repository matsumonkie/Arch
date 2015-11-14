unless Rails.env.production?
  montreal = City.create(name_translations: { fr: "Montréal", en: "Montreal" })
  quebec   = City.create(name_translations: { fr: "Québec", en: "Quebec" })
end
