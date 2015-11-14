class Api::TranslationsController < ApplicationController

  def index
    translation = TranslationOp.index(params)
    render json: translation if stale?(etag: translation)
  end
end
