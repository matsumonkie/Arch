class TemplatesController < ApplicationController

  def show
    template = TemplateOp.show(params)
    render file: template, layout: false
  end
end
