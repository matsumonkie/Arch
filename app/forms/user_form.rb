class UserForm < Form

  MODEL = :user
  WHITELIST = :firstname

  coerce :firstname

  def firstname
    Error(:firstname, :not_valid) if false
  end
end
