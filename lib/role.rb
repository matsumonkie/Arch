module Role
  attr_accessor :role

  def method_missing(method_name, *args, &block)
    if role && role.public_method_defined?(method_name)
      role.instance_method(method_name).bind(self).call(*args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_all=false)
    if role && role.public_method_defined?(method_name)
      true
    else
      super
    end
  end

  def play_role(role)
    self.role = role
    yield(self)
  ensure
    self.role = nil
  end
end
