module MetaTaggable

  extend ActiveSupport::Concern

  included do
    before_filter :set_keyword_tags
    before_filter :set_description_tags
  end

  def set_keyword_tags
    @keyword_tags = translation("meta_tags.keyword")
  end

  def set_description_tags
    @description_tags = translation("meta_tags.description")
  end

  protected

  def translation(key)
    I18n.t(key, default: ['meta_tags.default', ""])
  end
end
