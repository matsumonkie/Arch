class ValidPasswordValidator < ActiveModel::Validator

  def validate(record)
    unless valid_password?(record)
      record.errors[:password] << 'incorrect email/passwords'
    end
  end

  def valid_password?(record)
    record.play(PasswordRole) do |user|
      user.same_password?(record.password)
    end
  end
end
