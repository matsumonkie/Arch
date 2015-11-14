module PasswordRole

  def same_password?(unencrypted_password)
    encrypted_password == encrypt(unencrypted_password, salt)
  end

  def encrypt_password(unencrypted_password)
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password = encrypt(unencrypted_password, self.salt)
  end

  def encrypt(string, salt)
    BCrypt::Engine.hash_secret(string, salt)
  rescue BCrypt::Errors::InvalidSalt
    nil
  end
end
