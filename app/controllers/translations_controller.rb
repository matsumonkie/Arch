class TranslationsController < ApplicationController

  def show
    render json: TranslationOp.show(params)
  end
end
