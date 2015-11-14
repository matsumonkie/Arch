class UserConfirmationForm < Form

  validates :email, presence: true
  validates :confirmation_token, presence: true

  def model_not_found
    invalid_email_or_token = I18n.t('activemodel.errors.models.user_confirmation_form.model_not_found')
    errors = { email: [invalid_email_or_token] }
    super(errors)
  end

  protected

  def whitelist(params)
    super(params).permit(:email, :confirmation_token)
  end
end
