class UserOp < Operation

  def index params
    User.all
  end

  def update_email params
    {}
  end
end
