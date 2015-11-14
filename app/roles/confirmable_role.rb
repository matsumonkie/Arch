module ConfirmableRole

  def call
    self.tap do |object|
      object.singleton_class.send(:attr_accessor, :password)
      object.singleton_class.send(:attr_accessor, :password_repetition)
    end
  end
end
