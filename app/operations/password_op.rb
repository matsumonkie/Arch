class PasswordOp < Operation

  def change(params)
    If(User.find(params[:user_id])) do |user|
      if same?(user_id: user.id, password: params[:password][:current_password])
        user.play(ChangePasswordRole, :call)
        If(ChangePasswordForm.new(user, params)) do |form|
          encrypt(user, user.new_password)
        end
      else
        Return(InvalidForm.new(current_password: ["invalid password"]))
      end
    end
  end

  def encrypt(user, password)
    user.play(PasswordRole) do |user|
      user.encrypt_password(password)
      user.save
    end
  end

  # expect params to contains :user_id and :password
  def same?(params)
    User.find(params[:user_id]).play(PasswordRole) { |user|
      user.same_password?(params[:password])
    }
  end
end
