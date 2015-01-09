class TemplatesController < ApplicationController

  def model; :Template; end

  def show
    template = TemplateOp.show(params)
    render file: template, layout: false
  end
end
