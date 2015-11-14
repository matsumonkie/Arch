class UpdateUserForm < Form

  validates :email, presence: true

  protected

  def whitelist(params)
    super(params).require(:user).permit(:firstname, :lastname, :email)
  end
end
