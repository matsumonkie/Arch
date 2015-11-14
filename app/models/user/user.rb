class User

  include Role
  include Mongoid::Document
  include Mongoid::Timestamps

  include Activable
  include Passwordable
  include Localeable
  include Avatarable
  include Typeable
  include DefaultCurrency

  field :email     ,type: String, default: ""
  field :firstname ,type: String
  field :lastname  ,type: String

  def active_model_serializer
    UserSerializer
  end

  def admin?;      false; end
  def visitor?;    false; end
  def demo_user?;  false; end
  def transferee?; false; end
  def hr_user?;    false; end
end
