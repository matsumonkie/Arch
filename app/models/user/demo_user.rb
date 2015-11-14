class DemoUser < User

  extend Forwardable

  belongs_to :user

  def demo_user?; true; end

  def_delegators *%i[
    user
    active_model_serializer admin?
    visitor?
  ]
end
