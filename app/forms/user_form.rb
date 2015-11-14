class NewUserForm < Form

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :salt, presence: true

  protected

  def whitelist(params)
    super(params).require(:user).permit(:firstname, :lastname, :email, :salt, :encrypted_password)
  end
end
