class DemoUser < User

  extend Forwardable

  belongs_to :user

  def_delegators :user, :type, :firstname, :lastname

  def demo_user?; true; end
end
