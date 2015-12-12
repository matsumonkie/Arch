class User

  include Role
  include Mongoid::Document
  include Mongoid::Timestamps

  include Localeable
  include Activable
  include Passwordable
  include Avatarable
  include Typeable

  field :email     ,type: String, default: ""
  field :firstname ,type: String
  field :lastname  ,type: String

  def active_model_serializer
    UserSerializer
  end

  def admin?;      false; end
  def visitor?;    false; end
  def demo_user?;  false; end
  def regular?;    false; end
end
