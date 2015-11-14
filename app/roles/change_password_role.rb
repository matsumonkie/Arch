module ChangePasswordRole

  def call
    self.tap do |object|
      object.singleton_class.send(:attr_accessor, :new_password)
      object.singleton_class.send(:attr_accessor, :password_repetition)
    end
  end
end
