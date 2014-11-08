class User < ActiveRecord::Base
  attr_accessor :password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    else
      nil
    end
  end

end
