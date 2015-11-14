require 'valid_email'

class SigningUpForm < Form

  validates :email, presence: true, email: { message: I18n.t('activemodel.errors.models.signing_up_form.attributes.email.invalid_email') }

  protected

  def whitelist(params)
    super(params).require(:user).permit(:email, :firstname, :lastname)
  end
end
