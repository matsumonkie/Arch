module IntrospectionRole

  def who_am_i(type, &error_policy)
    error_policy ||= ->() { raise ArgumentError }
    type ||= ""
    mother = self.class
    child = klass_from(type.classify)

    if child && related?(mother, child)
      child
    else
      error_policy.call()
    end
  end

  def klass_from(type)
    type.constantize
  rescue NameError
    false
  end

  def related?(mother, child)
    child.ancestors.include?(mother)
  end
end
