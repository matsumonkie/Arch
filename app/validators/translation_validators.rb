class TranslationValidators

  def initialize(object, attribute, languages, error_messages)
    unless SetUtil.same?(object.send(attribute).keys, languages)
      object.errors.add(attribute, error_messages)
    end

    languages.each do |language|
      if object.send(attribute)[language].blank?
        object.errors.add(:name_translations, "missing translations for #{language}")
      end
    end
  end
end
