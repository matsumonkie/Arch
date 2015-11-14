class TranslationOp < Operation

  def index(params)
    modules = params[:id]
    modules.inject({}) do |translations, e|
      current_translation = { "#{e}": Hash[I18n.t(e)] }
      translations.merge(current_translation)
    end
  rescue ArgumentError
    {}
  end
end
