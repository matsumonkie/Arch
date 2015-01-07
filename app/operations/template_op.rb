class TemplateOp < Operation

  def show(params)
    "templates/#{params[:id]}"
  end
end
