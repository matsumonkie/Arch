class User

  include Role

  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :recoverable, :rememberable, :registerable

  # devise
  field :email, type: String, default: ""
  field :encrypted_password,     type: String, default: ""
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  field :remember_created_at,    type: Time

  field :firstname
  field :lastname

  def type
    self.class.to_s.underscore.to_sym
  end

  def admin?; false; end
  def visitor?; false; end
  def demo_user?; false; end
  def regular?; false; end

  def to_json
    {
      id: id,
      email: email,
      firstname: firstname,
      lastname: lastname,
      type: type,
    }
  end
end
