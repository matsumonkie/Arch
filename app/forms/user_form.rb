class UserForm < Form

  include ActiveModel::Validations

  validates :email, presence: true

  def attributes(params)
    self.attributes = whitelist(params)
  end

  protected

  def whitelist(params)
    super(params).require(:user).permit(:firstname, :lastname, :email)
  end
end
