class Form < SimpleDelegator

  protected

  def whitelist(params)
    ActionController::Parameters.new(params)
  end
end
