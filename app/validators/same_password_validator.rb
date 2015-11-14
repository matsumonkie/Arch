class SamePasswordValidator < ActiveModel::Validator

  def validate(record)
    if record.password != record.password_repetition
      record.errors[:password_repetition] << 'passwords are not identical'
    end
  end
end
