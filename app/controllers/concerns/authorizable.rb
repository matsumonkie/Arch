module Authorizable

  extend ActiveSupport::Concern

  included do
    before_filter :authorize
  end

  def model
    controller_name.to_sym
  end

  def action
    action_name.to_sym
  end

  def authorize
    user = Ability.new(@current_user, params)
    @action, @model = action(), model()
    return render_forbidden unless user.can?(@action, @model)
  end
end
