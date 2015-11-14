class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include Capybarable
  include Authentifiable
  include Renderable
  include Authorizable
  include Localizable
  include Titleable
  include MetaTaggable
  include Queryable
end
