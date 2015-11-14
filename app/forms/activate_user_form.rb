class ActivateUserForm < Form

  validates :password, presence: true, length: { minimum: 8 }
  validates :password_repetition, presence: true, length: { minimum: 8 }
  validate :valid_password

  def valid_password
    if password != password_repetition
      errors.add(:password_repetition, "passwords dont match")
    end
  end

  def model_not_found
    errors = { not_found: ['user not found'] }
    super(errors)
  end

  protected

  def whitelist(params)
    super(params).require(:account).permit(:password, :password_repetition)
  end
end
