class Form < SimpleDelegator

  protected

  def whitelist(params)
    yield ActionController::Parameters.new(params)
  end
end
