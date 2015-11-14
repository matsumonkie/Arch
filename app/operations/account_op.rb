class AccountOp < Operation

  def confirm(params)
    user = User.find_by(email: params[:email], confirmation_token: params[:confirmation_token])
    If(user) do |user|
      user.play(ConfirmableRole, :call)
    end
  end

  def activate(params)
    If(User.find_by(email: params[:account][:email],
                    confirmation_token: params[:account][:confirmation_token])) do |user|
      user.play(ConfirmableRole, :call)
      If(ActivateUserForm.new(user, params)) do |form|
        PasswordOp.encrypt(user, user.password)
        user.activated = true
        user.save
      end
    end
  end

  def reset_password(params)
    user = User.find_by(email: params[:account][:email])
    ResetTokenForm.new(user, params).tap do |form|
      if form.valid?
        reset_user(form)
        AccountMailer.reset_password(user).deliver_later
      end
    end
  end

  def close(params)
    If(User.find(params[:id])) { |user| user.close() }
  end

  def delete(params)
    user = User.find(params[:id])
    user.delete()
    {}
  end

  protected

  def reset_user(user)
    user.confirmation_token = User.new.confirmation_token
    user.activated = false
    user.save
  end
end
