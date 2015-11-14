class SessionOp < Operation

  def create(params)
    user = User.find_by(email: params[:session][:email]) || Visitor.new
    signable_user = user.play(SignableRole, :call)
    SigningInForm.new(signable_user, params)
  end
end
