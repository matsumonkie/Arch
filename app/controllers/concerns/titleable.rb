module Titleable

  extend ActiveSupport::Concern

  included do
    before_filter :set_title
  end

  def set_title
    page = model()
    @title = I18n.t("title.#{model}")
  end
end
