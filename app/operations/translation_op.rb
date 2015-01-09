class TranslationOp < Operation

  def show(params)
    Hash[I18n.t(params[:id])]
  rescue ArgumentError
    {}
  end
end
