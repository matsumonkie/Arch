module SignableRole

  def call
    self.tap do |object|
      object.singleton_class.send(:attr_accessor, :password)
    end
  end
end
