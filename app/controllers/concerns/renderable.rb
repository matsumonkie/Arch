module Renderable

  extend ActiveSupport::Concern

  def default_serializer_options
    { current_user: @current_user }
  end

  def render_for(object, opts = {})
    object_to_serialize = find_delegated(object)

    if valid?(object)
      render json: object_to_serialize,
             status: :ok,
             serializer: opts[:serializer]
    else
      if object.respond_to?(:errors)
        render json: object.errors,
               status: :unprocessable_entity
      else
        render json: object,
               status: :unprocessable_entity
      end
    end
  end

  def find_delegated(object)
    if object.respond_to?(:delegated) then object.delegated else object end
  end

  def valid?(object)
    if object.respond_to?(:valid?) then object.valid? else object end
  end

  def render_forbidden
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/403", formats: [ :html ], status: :forbidden, layout: false }
      format.json { render json: {}, status: :forbidden }
    end
  end
end
