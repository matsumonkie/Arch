class SigningInForm < Form

  validate :valid_password
  #validates :email, email: { message: I18n.t('activemodel.errors.models.signing_in_form.attributes.email.invalid_email') }
  validate :valid_user

  def valid_password
    play(PasswordRole) do |user|
      unless user.same_password?(password)
        invalid_email_or_password = I18n.t('activemodel.errors.models.signing_in_form.attributes.email.invalid_email_or_password')
        errors.add(:password, invalid_email_or_password)
      end
    end
  end

  def valid_user
    if not(self.signable?)
      invalid_account = I18n.t('activemodel.errors.models.signing_in_form.attributes.account.closed_or_expired')
      errors.add(:other, invalid_account)
    end
  end

  protected

  def whitelist(params)
    super(params).require(:session).permit(:password)
  end
end
